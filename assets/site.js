const SUPABASE_URL = "https://gmreokrnnfjbbqwegpax.supabase.co";
const SUPABASE_KEY = "sb_publishable_2ZTkLzeow2adwj3WE-lbjQ_5i_kBNSL";

document.addEventListener("DOMContentLoaded", () => {
  initMenu();
  initBeforeAfter();
  initSupabaseContent();
  initContactInquiryForm();
  initAdminDashboard();
});

function initMenu() {
  const menuButton = document.querySelector(".hamb");
  const mobileMenu = document.querySelector("#mobile");
  if (!menuButton || !mobileMenu) return;
  menuButton.addEventListener("click", () => {
    const open = mobileMenu.classList.toggle("open");
    menuButton.setAttribute("aria-expanded", String(open));
  });
}

function initBeforeAfter() {
  const fieldMain = document.querySelector("#fieldMain");
  const tabs = [...document.querySelectorAll(".ba-tab")];
  const items = [...document.querySelectorAll(".change-list .fieldbtn")];
  let currentItem = items[0] || null;
  const setTabs = (mode) => tabs.forEach((tab) => {
    const active = tab.dataset.ba === mode;
    tab.classList.toggle("active", active);
    tab.setAttribute("aria-selected", String(active));
  });
  const showImage = (src, alt) => {
    if (!fieldMain || !src) return;
    fieldMain.style.opacity = ".2";
    window.setTimeout(() => {
      fieldMain.src = src;
      fieldMain.alt = alt || "청소 작업 전후 이미지";
      fieldMain.style.opacity = "1";
    }, 120);
  };
  tabs.forEach((tab) => tab.addEventListener("click", () => {
    if (!currentItem) return;
    const mode = tab.dataset.ba;
    const src = currentItem.dataset[mode];
    if (!src) return;
    setTabs(mode);
    showImage(src, `${currentItem.dataset.title || "청소"} ${tab.textContent} 통이미지`);
  }));
  items.forEach((item) => item.addEventListener("click", () => {
    currentItem = item;
    items.forEach((btn) => btn.classList.remove("active"));
    item.classList.add("active");
    setTabs("after");
    showImage(item.dataset.after, `${item.dataset.title || "청소"} 작업 후 통이미지`);
  }));
  if (currentItem) {
    currentItem.classList.add("active");
    setTabs("after");
  }
}

async function initSupabaseContent() {
  if (!window.fetch || !SUPABASE_URL || !SUPABASE_KEY) return;
  const path = normalizePath(window.location.pathname);
  if (document.querySelector(".home-case-board")) renderHomeCases();
  if (document.querySelector(".guide-home-sec .cards")) renderHomeGuides();
  if (document.querySelector(".faq-sec .faq-grid")) renderHomeFaqs();
  if (path === "/cases/") renderCasesIndex();
  if (path === "/cleaning-info/") renderCleaningInfoIndex();
  if (path === "/faq/") renderFaqIndex();
}

function normalizePath(path) {
  return path.endsWith("/") ? path : `${path}/`;
}

async function supabaseRest(table, params, token) {
  const response = await fetch(`${SUPABASE_URL}/rest/v1/${table}?${params}`, {
    headers: {
      apikey: SUPABASE_KEY,
      Authorization: `Bearer ${token || SUPABASE_KEY}`,
      "Content-Type": "application/json",
    },
  });
  if (!response.ok) throw new Error(await response.text());
  return response.json();
}

async function supabaseInsert(table, body) {
  const response = await fetch(`${SUPABASE_URL}/rest/v1/${table}`, {
    method: "POST",
    headers: {
      apikey: SUPABASE_KEY,
      Authorization: `Bearer ${SUPABASE_KEY}`,
      "Content-Type": "application/json",
      Prefer: "return=minimal",
    },
    body: JSON.stringify(body),
  });
  if (!response.ok) throw new Error(await response.text());
}

async function renderHomeCases() {
  try {
    const rows = await supabaseRest("cases", "select=slug,title,service,region,summary,cover_image_path,cover_image_alt,published_at&status=eq.published&is_featured=eq.true&order=published_at.desc&limit=3");
    if (rows.length) document.querySelector(".home-case-board").innerHTML = rows.map(caseCard).join("");
  } catch (error) { console.warn("Supabase home cases fallback:", error); }
}

async function renderHomeGuides() {
  try {
    const rows = await supabaseRest("cleaning_posts", "select=slug,legacy_path,title,category,summary,cover_image_path,cover_image_alt,published_at&status=eq.published&order=published_at.desc&limit=3");
    if (rows.length) document.querySelector(".guide-home-sec .cards").innerHTML = rows.map(guideCard).join("");
  } catch (error) { console.warn("Supabase home guides fallback:", error); }
}

async function renderHomeFaqs() {
  try {
    const rows = await supabaseRest("faqs", "select=question,answer&status=eq.published&show_on_home=eq.true&order=sort_order.asc&limit=6");
    if (rows.length) document.querySelector(".faq-sec .faq-grid").innerHTML = rows.map(faqItem).join("");
  } catch (error) { console.warn("Supabase home FAQs fallback:", error); }
}

async function renderCasesIndex() {
  const grid = document.querySelector(".case-board-grid");
  if (!grid) return;
  try {
    const rows = await supabaseRest("cases", "select=slug,title,service,region,summary,cover_image_path,cover_image_alt,published_at&status=eq.published&order=published_at.desc,created_at.desc");
    if (rows.length) grid.innerHTML = rows.map(caseCard).join("");
  } catch (error) { console.warn("Supabase cases fallback:", error); }
}

async function renderCleaningInfoIndex() {
  const grid = document.querySelector(".ci-grid");
  if (!grid) return;
  try {
    const rows = await supabaseRest("cleaning_posts", "select=slug,legacy_path,title,category,summary,tags,cover_image_path,cover_image_alt,published_at,is_featured&status=eq.published&order=published_at.desc,created_at.desc");
    if (!rows.length) return;
    const featured = rows.find((row) => row.is_featured) || rows[0];
    const featuredEl = document.querySelector(".ci-featured");
    if (featuredEl) featuredEl.outerHTML = cleaningFeatured(featured);
    grid.innerHTML = rows.map(cleaningCard).join("");
    rebindCleaningInfoFilters();
  } catch (error) { console.warn("Supabase cleaning info fallback:", error); }
}

async function renderFaqIndex() {
  const list = document.querySelector(".faq:not(.faq-grid)");
  if (!list) return;
  try {
    const rows = await supabaseRest("faqs", "select=question,answer&status=eq.published&order=sort_order.asc,created_at.asc");
    if (rows.length) list.innerHTML = rows.map(faqItem).join("");
  } catch (error) { console.warn("Supabase FAQ fallback:", error); }
}

function caseCard(row) {
  return `<a class="case board-card" href="/cases/${escapeAttr(row.slug)}/"><img src="${escapeAttr(row.cover_image_path || "/public/images/field-office-after.svg")}" alt="${escapeAttr(row.cover_image_alt || `${row.title} 대표 현장사진`)}" loading="lazy"><span>${escapeHtml(row.service)}</span><small>${escapeHtml(row.service)} · ${escapeHtml(row.region || "작업지역 비공개")}</small><h3>${escapeHtml(row.title)}</h3><p>${escapeHtml(row.summary || "")}</p><time>${formatDate(row.published_at)}</time><b>자세히 보기</b></a>`;
}

function guideCard(row) {
  return `<a class="card" href="${escapeAttr(postHref(row))}"><img src="${escapeAttr(row.cover_image_path || "/public/images/services-hero-comprehensive-v1.webp")}" alt="${escapeAttr(row.cover_image_alt || `${row.title} 설명 이미지`)}" loading="lazy"><span>${escapeHtml(row.category)}</span><b>${escapeHtml(row.title)}</b><p>${escapeHtml(row.summary || "")}</p><small>${formatDate(row.published_at)}</small></a>`;
}

function cleaningFeatured(row) {
  return `<a class="ci-featured" href="${escapeAttr(postHref(row))}"><img src="${escapeAttr(row.cover_image_path || "/public/images/cleaning-info/office-floor-care.webp")}" alt="${escapeAttr(row.cover_image_alt || `${row.title} 추천 이미지`)}"><div><span>${escapeHtml(row.category)}</span><h2>${escapeHtml(row.title)}</h2><p>${escapeHtml(row.summary || "")}</p><time>${formatDate(row.published_at).replaceAll("-", ".")}</time><b class="btn">자세히 보기</b></div></a>`;
}

function cleaningCard(row) {
  const search = [row.title, row.summary, row.category, ...(row.tags || [])].filter(Boolean).join(" ");
  return `<a class="ci-card" data-category="${escapeAttr(row.category)}" data-search="${escapeAttr(search)}" href="${escapeAttr(postHref(row))}"><img src="${escapeAttr(row.cover_image_path || "/public/images/cleaning-info/office-floor-care.webp")}" alt="${escapeAttr(row.cover_image_alt || `${row.title} 대표 이미지`)}" loading="lazy" width="640" height="360"><span>${escapeHtml(row.category)}</span><h3>${escapeHtml(row.title)}</h3><p>${escapeHtml(row.summary || "")}</p><time>${formatDate(row.published_at).replaceAll("-", ".")}</time><b>자세히 보기</b></a>`;
}

function faqItem(row, index = 0) {
  return `<details ${index === 0 ? "open" : ""}><summary>${escapeHtml(row.question)}</summary><p>${escapeHtml(row.answer)}</p></details>`;
}

function postHref(row) {
  return row.legacy_path || `/cleaning-info/${row.slug}/`;
}

function rebindCleaningInfoFilters() {
  const search = document.querySelector("#ciSearch");
  const reset = document.querySelector("#ciReset");
  const tabs = [...document.querySelectorAll("[data-category-filter]")];
  const cards = [...document.querySelectorAll(".ci-card")];
  if (!cards.length) return;
  let category = "전체";
  const apply = () => {
    const q = (search?.value || "").trim().toLowerCase();
    cards.forEach((card) => {
      const okCategory = category === "전체" || card.dataset.category === category;
      const okSearch = !q || (card.dataset.search || "").toLowerCase().includes(q);
      card.hidden = !(okCategory && okSearch);
    });
  };
  tabs.forEach((tab) => tab.addEventListener("click", () => {
    category = tab.dataset.categoryFilter || "전체";
    tabs.forEach((item) => item.classList.toggle("active", item === tab));
    apply();
  }));
  search?.addEventListener("input", apply);
  reset?.addEventListener("click", () => {
    if (search) search.value = "";
    category = "전체";
    tabs.forEach((item) => item.classList.toggle("active", item.dataset.categoryFilter === "전체"));
    apply();
  });
}

function initContactInquiryForm() {
  const target = document.querySelector(".contact-page .contact-main");
  if (!target || document.querySelector("#inquiryForm")) return;
  target.insertAdjacentHTML("afterbegin", inquiryFormHtml());
  const form = document.querySelector("#inquiryForm");
  const status = document.querySelector("#inquiryStatus");
  form.addEventListener("submit", async (event) => {
    event.preventDefault();
    const submit = form.querySelector("button[type='submit']");
    const data = new FormData(form);
    const payload = {
      customer_name: String(data.get("customer_name") || "").trim(),
      phone: String(data.get("phone") || "").trim(),
      email: String(data.get("email") || "").trim() || null,
      cleaning_type: String(data.get("cleaning_type") || "").trim(),
      region: String(data.get("region") || "").trim(),
      space_type: String(data.get("space_type") || "").trim() || null,
      area_size: String(data.get("area_size") || "").trim() || null,
      preferred_date: String(data.get("preferred_date") || "").trim() || null,
      preferred_contact: String(data.get("preferred_contact") || "phone"),
      message: String(data.get("message") || "").trim(),
      privacy_agreed: data.get("privacy_agreed") === "on",
      user_agent: window.navigator.userAgent,
    };
    if (!payload.customer_name || !payload.phone || !payload.cleaning_type || !payload.region || !payload.message || !payload.privacy_agreed) {
      setStatus(status, "필수 항목과 개인정보 동의를 확인해 주세요.", "error");
      return;
    }
    submit.disabled = true;
    submit.textContent = "접수 중";
    setStatus(status, "문의 내용을 저장하고 있습니다.", "info");
    try {
      await supabaseInsert("inquiries", payload);
      form.reset();
      setStatus(status, "문의가 접수되었습니다. 확인 후 연락드리겠습니다.", "success");
    } catch (error) {
      console.error(error);
      setStatus(status, "접수 중 오류가 발생했습니다. 급하신 경우 전화 또는 문자로 연락해 주세요.", "error");
    } finally {
      submit.disabled = false;
      submit.textContent = "상담문의 접수";
    }
  });
}

function inquiryFormHtml() {
  return `<form id="inquiryForm" class="inquiry-form"><div class="form-head"><p class="eyebrow">ONLINE REQUEST</p><h2>홈페이지에서 상담문의 접수</h2><span>접수 내용은 관리자만 확인할 수 있습니다.</span></div><div class="form-grid"><label>이름 또는 업체명<input name="customer_name" autocomplete="name" required></label><label>연락처<input name="phone" type="tel" autocomplete="tel" required></label><label>이메일<input name="email" type="email" autocomplete="email"></label><label>상담 방식<select name="preferred_contact"><option value="phone">전화</option><option value="sms">문자</option><option value="email">이메일</option><option value="kakao">카카오톡</option></select></label><label>청소 희망 지역<input name="region" placeholder="예: 인천 송도, 서울 강남" required></label><label>서비스 종류<select name="cleaning_type" required><option value="">선택해 주세요</option><option>정기청소</option><option>상가·사무실청소</option><option>입주·이사청소</option><option>바닥·왁스코팅</option><option>화장실청소</option><option>유리창청소</option><option>급식실·주방청소</option><option>소파·매트리스·카펫</option><option>에어컨청소</option><option>특수청소</option><option>기타 상담</option></select></label><label>공간 유형<input name="space_type" placeholder="예: 사무실, 매장, 아파트"></label><label>면적/규모<input name="area_size" placeholder="예: 30평, 화장실 2칸"></label><label class="wide">희망 일정<input name="preferred_date" placeholder="예: 이번 주 평일 오전"></label><label class="wide">문의내용<textarea name="message" rows="5" placeholder="사진은 문자로 함께 보내주시면 더 정확히 안내드립니다." required></textarea></label></div><label class="agree"><input type="checkbox" name="privacy_agreed" required><span>개인정보 수집 및 상담 목적 이용에 동의합니다.</span></label><button class="btn" type="submit">상담문의 접수</button><p id="inquiryStatus" class="form-status" role="status" aria-live="polite"></p></form>`;
}

function setStatus(el, text, type) {
  if (!el) return;
  el.textContent = text;
  el.dataset.type = type;
}

function initAdminDashboard() {
  if (!document.body.classList.contains("admin-page")) return;
  const form = document.querySelector("#adminLoginForm");
  const logout = document.querySelector("#adminLogout");
  const status = document.querySelector("#adminStatus");
  const list = document.querySelector("#adminInquiryList");
  const session = getAdminSession();
  if (session?.access_token) loadAdminInquiries(session.access_token);
  form?.addEventListener("submit", async (event) => {
    event.preventDefault();
    const data = new FormData(form);
    setStatus(status, "로그인 확인 중입니다.", "info");
    try {
      const sessionData = await signInAdmin(String(data.get("email") || ""), String(data.get("password") || ""));
      localStorage.setItem("chc_admin_session", JSON.stringify(sessionData));
      form.reset();
      setStatus(status, "로그인되었습니다.", "success");
      loadAdminInquiries(sessionData.access_token);
    } catch (error) {
      console.error(error);
      setStatus(status, "로그인에 실패했습니다. 계정 권한을 확인해 주세요.", "error");
    }
  });
  logout?.addEventListener("click", () => {
    localStorage.removeItem("chc_admin_session");
    if (list) list.innerHTML = "";
    setStatus(status, "로그아웃되었습니다.", "info");
  });
}

async function signInAdmin(email, password) {
  const response = await fetch(`${SUPABASE_URL}/auth/v1/token?grant_type=password`, {
    method: "POST",
    headers: { apikey: SUPABASE_KEY, "Content-Type": "application/json" },
    body: JSON.stringify({ email, password }),
  });
  if (!response.ok) throw new Error(await response.text());
  return response.json();
}

function getAdminSession() {
  try { return JSON.parse(localStorage.getItem("chc_admin_session") || "null"); }
  catch { return null; }
}

async function loadAdminInquiries(token) {
  const list = document.querySelector("#adminInquiryList");
  const status = document.querySelector("#adminStatus");
  if (!list) return;
  setStatus(status, "문의 목록을 불러오는 중입니다.", "info");
  try {
    const rows = await supabaseRest("inquiries", "select=receipt_no,customer_name,phone,email,cleaning_type,region,preferred_contact,preferred_date,message,status,created_at&order=created_at.desc&limit=50", token);
    list.innerHTML = rows.length ? rows.map(adminInquiryCard).join("") : `<p class="empty">아직 접수된 문의가 없습니다.</p>`;
    setStatus(status, `문의 ${rows.length}건을 불러왔습니다.`, "success");
  } catch (error) {
    console.error(error);
    setStatus(status, "문의 목록을 볼 수 없습니다. 관리자 권한 등록 여부를 확인해 주세요.", "error");
  }
}

function adminInquiryCard(row) {
  return `<article class="admin-inquiry"><div><span>${escapeHtml(row.status)}</span><b>${escapeHtml(row.receipt_no)}</b><time>${formatDate(row.created_at)}</time></div><h3>${escapeHtml(row.customer_name)} · ${escapeHtml(row.cleaning_type)}</h3><p>${escapeHtml(row.message)}</p><dl><div><dt>연락처</dt><dd>${escapeHtml(row.phone)}</dd></div><div><dt>지역</dt><dd>${escapeHtml(row.region)}</dd></div><div><dt>희망연락</dt><dd>${escapeHtml(row.preferred_contact)}</dd></div><div><dt>희망일정</dt><dd>${escapeHtml(row.preferred_date || "-")}</dd></div></dl></article>`;
}

function formatDate(value) {
  if (!value) return "";
  return String(value).slice(0, 10);
}

function escapeHtml(value) {
  return String(value ?? "").replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll('"', "&quot;").replaceAll("'", "&#39;");
}

function escapeAttr(value) {
  return escapeHtml(value).replaceAll("`", "&#96;");
}
