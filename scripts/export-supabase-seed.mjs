import fs from "node:fs";
import path from "node:path";

const root = process.cwd();
const outPath = path.join(root, "supabase", "seed.sql");

function readJson(file) {
  return JSON.parse(fs.readFileSync(path.join(root, file), "utf8"));
}

function sql(value) {
  if (value === undefined || value === null || value === "") return "null";
  if (Array.isArray(value)) return `array[${value.map(sql).join(", ")}]`;
  if (typeof value === "boolean") return value ? "true" : "false";
  if (typeof value === "number") return String(value);
  return `'${String(value).replaceAll("'", "''")}'`;
}

function jsonb(value) {
  return `'${JSON.stringify(value ?? []).replaceAll("'", "''")}'::jsonb`;
}

function dateFromDotted(value) {
  if (!value) return null;
  return String(value).replaceAll(".", "-");
}

const cases = readJson("content/cases.json");
const cleaningPosts = readJson("content/cleaning-info.json");
const guides = readJson("content/guides.json");

const faqItems = [
  ["서울·경기·인천 전 지역에 출장 가능한가요?", "네. 서울·경기·인천 전 지역 상담이 가능하며, 일정과 작업 범위에 따라 방문 시간을 안내합니다.", "서비스"],
  ["견적은 어떻게 결정되나요?", "공간 면적, 오염 정도, 작업 높이, 장비 진입 가능 여부, 작업 시간 등을 기준으로 안내합니다.", "견적"],
  ["현장 방문 없이 견적을 받을 수 있나요?", "현장 사진과 기본 정보를 보내주시면 1차 상담이 가능하며, 필요 시 방문 확인 후 최종 견적을 안내합니다.", "견적"],
  ["청소 전에 무엇을 준비해야 하나요?", "귀중품과 파손 위험 물품은 미리 보관해 주시고, 작업이 필요한 공간은 가능한 비워두시면 좋습니다.", "작업 준비"],
  ["작업 시간은 보통 얼마나 걸리나요?", "공간 크기와 오염 상태에 따라 다르며, 상담 시 예상 작업 시간을 함께 안내합니다.", "일정"],
  ["주말이나 야간 작업도 가능한가요?", "가능 일정이 있는 경우 조율해 드립니다. 상가나 사무실은 영업 시간 이후 작업도 상담 가능합니다.", "일정"],
  ["사무실 청소는 업무 시간 외에도 가능한가요?", "네. 퇴근 후나 휴무일 작업이 필요한 경우 일정 조율 후 진행할 수 있습니다.", "일정"],
  ["바닥 왁스코팅은 어떤 공간에 적합한가요?", "사무실, 상가, 복도, 병원, 학원 등 바닥 광택과 보호가 필요한 공간에 적합합니다.", "서비스"],
  ["화장실 냄새와 물때 제거도 가능한가요?", "오염 상태를 확인한 뒤 세면대, 변기, 바닥, 벽면, 배수구 주변을 중심으로 작업합니다.", "서비스"],
  ["유리창 청소는 높은 곳도 가능한가요?", "작업 높이와 안전 조건을 확인한 뒤 가능 여부를 안내합니다.", "서비스"],
  ["에어컨 청소는 언제 하는 것이 좋나요?", "사용 전 시즌, 냄새가 날 때, 먼지가 보일 때, 장기간 사용 후에 청소를 권장합니다.", "서비스"],
  ["입주·이사청소는 어느 범위까지 하나요?", "바닥, 창틀, 욕실, 주방, 수납장 외부 등 입주 전 확인이 필요한 구역을 중심으로 진행합니다.", "서비스"],
  ["주방이나 급식실 기름때도 제거 가능한가요?", "후드, 벽면, 조리대, 바닥 등 기름 오염 구역을 확인하고 적합한 세정 방식으로 작업합니다.", "서비스"],
  ["소파·매트리스 케어는 어떤 경우에 필요할까요?", "생활 냄새, 먼지, 패브릭 오염, 오래 사용한 침구류 관리가 필요할 때 상담 가능합니다.", "서비스"],
  ["청소 후 확인은 어떻게 진행하나요?", "작업 완료 후 주요 구역을 함께 확인하고, 필요한 부분은 현장에서 안내드립니다.", "사후관리"]
];

const lines = [];
lines.push("-- Generated from existing JSON/static content. Review before applying.");
lines.push("begin;");
lines.push("delete from public.case_images ci using public.cases c where ci.case_id = c.id and c.source = ''migrated'';");
lines.push("delete from public.cleaning_post_images cpi using public.cleaning_posts cp where cpi.post_id = cp.id and cp.source = ''migrated'';");
lines.push("delete from public.faqs where source = ''migrated'';");

for (const c of cases) {
  if (!c.slug || c.slug.startsWith("draft-new")) continue;
  const status = c.status === "published" ? "published" : "draft";
  lines.push(`insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)`);
  lines.push(`values (${sql(c.slug)}, ${sql(c.title)}, ${sql(c.service)}, ${sql(c.region)}, ${sql(c.summary)}, ${sql((c.description || []).join("\n\n"))}, ${sql(c.images?.[0])}, ${sql(`${c.title} 대표 현장사진`)}, ${sql(Boolean(c.featured))}, ${sql(status)}, ${sql(c.relatedService)}, 'migrated', ${sql(dateFromDotted(c.publishedAt))}::timestamptz)`);
  lines.push(`on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;`);
  for (const [index, image] of (c.images || []).entries()) {
    lines.push(`insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)`);
    lines.push(`select id, ${sql(image)}, ${sql(`${c.title} 현장사진 ${index + 1}`)}, ${sql(c.imageCaptions?.[index] || "현장사진")}, ${index} from public.cases where slug = ${sql(c.slug)};`);
  }
}

for (const p of cleaningPosts) {
  lines.push(`insert into public.cleaning_posts (slug, title, category, cover_image_path, cover_image_alt, summary, body, tags, related_service_path, is_featured, status, source, published_at)`);
  lines.push(`values (${sql(p.slug)}, ${sql(p.title)}, ${sql(p.category)}, ${sql(p.thumbnail)}, ${sql(`${p.title} 대표 이미지`)}, ${sql(p.summary)}, ${jsonb([])}, ${sql(p.tags || [])}, ${sql(p.relatedService)}, ${sql(Boolean(p.featured))}, 'published', 'migrated', ${sql(dateFromDotted(p.publishedAt))}::timestamptz)`);
  lines.push(`on conflict (slug) do update set title = excluded.title, category = excluded.category, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, summary = excluded.summary, tags = excluded.tags, related_service_path = excluded.related_service_path, is_featured = excluded.is_featured, status = excluded.status, source = excluded.source, published_at = excluded.published_at;`);
}

for (const g of guides) {
  const status = g.status === "published" ? "published" : "draft";
  lines.push(`insert into public.cleaning_posts (slug, legacy_path, title, category, cover_image_path, cover_image_alt, summary, body, tags, related_service_path, related_case_slugs, is_featured, status, source, published_at)`);
  lines.push(`values (${sql(g.slug)}, ${sql(`/guide/${g.slug}/`)}, ${sql(g.title)}, ${sql(g.categoryLabel || g.category)}, ${sql(g.coverImage)}, ${sql(`${g.title} 설명 이미지`)}, ${sql(g.summary)}, ${jsonb((g.sections || []).map((text, index) => ({ type: "paragraph", sortOrder: index, text })))}, ${sql([])}, ${sql(g.relatedService)}, ${sql(g.relatedCases || [])}, false, ${sql(status)}, 'migrated', ${sql(g.date)}::timestamptz)`);
  lines.push(`on conflict (slug) do update set legacy_path = excluded.legacy_path, title = excluded.title, category = excluded.category, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, summary = excluded.summary, body = excluded.body, related_service_path = excluded.related_service_path, related_case_slugs = excluded.related_case_slugs, status = excluded.status, source = excluded.source, published_at = excluded.published_at;`);
}

faqItems.forEach(([question, answer, category], index) => {
  lines.push(`insert into public.faqs (question, answer, category, sort_order, status, show_on_home, source)`);
  lines.push(`values (${sql(question)}, ${sql(answer)}, ${sql(category)}, ${index}, 'published', ${index < 6 ? 'true' : 'false'}, 'migrated');`);
});

lines.push("commit;");
fs.mkdirSync(path.dirname(outPath), { recursive: true });
fs.writeFileSync(outPath, lines.join("\n"), "utf8");
console.log(`Wrote ${outPath}`);
console.log(JSON.stringify({ cases: cases.filter((c) => c.slug && !c.slug.startsWith("draft-new")).length, cleaningPosts: cleaningPosts.length, guides: guides.length, faqs: faqItems.length }, null, 2));

