-- Generated from existing JSON/static content. Review before applying.
begin;
delete from public.case_images ci using public.cases c where ci.case_id = c.id and c.source = ''migrated'';
delete from public.cleaning_post_images cpi using public.cleaning_posts cp where cpi.post_id = cp.id and cp.source = ''migrated'';
delete from public.faqs where source = ''migrated'';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-01', '고양이오줌 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

고양이오줌 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-01-1.webp', '고양이오줌 작업 대표 현장사진', true, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-01-1.webp', '고양이오줌 작업 현장사진 1', '고양이오줌 현장사진', 0 from public.cases where slug = 'case-01';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-01-2.webp', '고양이오줌 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-01';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-02', '카페트 습식케어 작업', '소파·매트리스·카펫', '작업지역 비공개', '카페트에 쌓인 먼지와 얼룩, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

카페트 습식케어 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-02-1.webp', '카페트 습식케어 작업 대표 현장사진', true, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-02-1.webp', '카페트 습식케어 작업 현장사진 1', '카페트 습식케어 현장사진', 0 from public.cases where slug = 'case-02';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-02-2.webp', '카페트 습식케어 작업 현장사진 2', '카페트 관리 작업 장면', 1 from public.cases where slug = 'case-02';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-03', '강아지오줌얼룩제거 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

강아지오줌얼룩제거 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-03-1.webp', '강아지오줌얼룩제거 작업 대표 현장사진', true, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-03-1.webp', '강아지오줌얼룩제거 작업 현장사진 1', '강아지오줌얼룩제거 현장사진', 0 from public.cases where slug = 'case-03';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-03-2.webp', '강아지오줌얼룩제거 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-03';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-04', '5년중고매트리스 습식케어 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

5년중고매트리스 습식케어 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-04-1.webp', '5년중고매트리스 습식케어 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-04-1.webp', '5년중고매트리스 습식케어 작업 현장사진 1', '5년중고매트리스 습식케어 현장사진', 0 from public.cases where slug = 'case-04';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-04-2.webp', '5년중고매트리스 습식케어 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-04';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-05', '곰팡이 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

곰팡이 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-05-1.webp', '곰팡이 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-05-1.webp', '곰팡이 작업 현장사진 1', '곰팡이 현장사진', 0 from public.cases where slug = 'case-05';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-05-2.webp', '곰팡이 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-05';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-06', '리모델링 후 매트리스케어 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

리모델링 후 매트리스케어 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-06-1.webp', '리모델링 후 매트리스케어 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-06-1.webp', '리모델링 후 매트리스케어 작업 현장사진 1', '리모델링 후 매트리스케어 현장사진', 0 from public.cases where slug = 'case-06';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-06-2.webp', '리모델링 후 매트리스케어 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-06';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-07', '고양이오줌얼룩케어 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

고양이오줌얼룩케어 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-07-1.webp', '고양이오줌얼룩케어 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-07-1.webp', '고양이오줌얼룩케어 작업 현장사진 1', '고양이오줌얼룩케어 현장사진', 0 from public.cases where slug = 'case-07';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-07-2.webp', '고양이오줌얼룩케어 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-07';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-08', '강아지 오줌얼룩제거 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

강아지 오줌오얼룩제거 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-08-1.webp', '강아지 오줌얼룩제거 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-08-1.webp', '강아지 오줌얼룩제거 작업 현장사진 1', '강아지 오줌얼룩제거 현장사진', 0 from public.cases where slug = 'case-08';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-08-2.webp', '강아지 오줌얼룩제거 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-08';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-09', '강아지 오줌얼룩 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

강아지 오줌얼룩 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-09-1.webp', '강아지 오줌얼룩 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-09-1.webp', '강아지 오줌얼룩 작업 현장사진 1', '강아지 오줌얼룩 현장사진', 0 from public.cases where slug = 'case-09';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-09-2.webp', '강아지 오줌얼룩 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-09';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-10', '강아지 얼룩 카페트 작업', '소파·매트리스·카펫', '작업지역 비공개', '카페트에 쌓인 먼지와 얼룩, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

강아지 얼룩 카페트 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-10-1.webp', '강아지 얼룩 카페트 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-10-1.webp', '강아지 얼룩 카페트 작업 현장사진 1', '강아지 얼룩 카페트 현장사진', 0 from public.cases where slug = 'case-10';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-10-2.webp', '강아지 얼룩 카페트 작업 현장사진 2', '카페트 관리 작업 장면', 1 from public.cases where slug = 'case-10';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-11', '일반 카페트스팀청소 작업', '소파·매트리스·카펫', '작업지역 비공개', '카페트에 쌓인 먼지와 얼룩, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

일반 카페트스팀청소 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-11-1.webp', '일반 카페트스팀청소 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-11-1.webp', '일반 카페트스팀청소 작업 현장사진 1', '일반 카페트스팀청소 현장사진', 0 from public.cases where slug = 'case-11';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-11-2.webp', '일반 카페트스팀청소 작업 현장사진 2', '카페트 관리 작업 장면', 1 from public.cases where slug = 'case-11';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-12', '강아지고양이 오줌얼룩스팀케어 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

강아지고양이 오줌얼룩스팀케어 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-12-1.webp', '강아지고양이 오줌얼룩스팀케어 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-12-1.webp', '강아지고양이 오줌얼룩스팀케어 작업 현장사진 1', '강아지고양이 오줌얼룩스팀케어 현장사진', 0 from public.cases where slug = 'case-12';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-12-2.webp', '강아지고양이 오줌얼룩스팀케어 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-12';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-13', '두아이 오줌습식케어 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

두아이 오줌습식케어 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-13-1.webp', '두아이 오줌습식케어 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-13-1.webp', '두아이 오줌습식케어 작업 현장사진 1', '두아이 오줌습식케어 현장사진', 0 from public.cases where slug = 'case-13';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-13-2.webp', '두아이 오줌습식케어 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-13';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-14', '강아지 오줌얼룩제거 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

강아지 오줌얼룩제거 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-14-1.webp', '강아지 오줌얼룩제거 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-14-1.webp', '강아지 오줌얼룩제거 작업 현장사진 1', '강아지 오줌얼룩제거 현장사진', 0 from public.cases where slug = 'case-14';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-14-2.webp', '강아지 오줌얼룩제거 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-14';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-15', '2인용리클라이너 클리닝 작업', '소파·매트리스·카펫', '작업지역 비공개', '2인용리클라이너의 먼지와 생활오염을 확인하고 패브릭 표면을 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

2인용리클라이너케어 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-15-1.webp', '2인용리클라이너 클리닝 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-15-1.webp', '2인용리클라이너 클리닝 작업 현장사진 1', '2인용리클라이너 클리닝 현장', 0 from public.cases where slug = 'case-15';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-15-2.webp', '2인용리클라이너 클리닝 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-15';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-16', '이사후매트리스습식케어 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

이사후매트리스습식케어 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-16-1.webp', '이사후매트리스습식케어 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-16-1.webp', '이사후매트리스습식케어 작업 현장사진 1', '이사후매트리스습식케어 현장사진', 0 from public.cases where slug = 'case-16';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-16-2.webp', '이사후매트리스습식케어 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-16';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-17', '고양이오줌얼룩제거 스팀케어 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

고양이오줌얼룩제거 스팀케어 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-17-1.webp', '고양이오줌얼룩제거 스팀케어 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-17-1.webp', '고양이오줌얼룩제거 스팀케어 작업 현장사진 1', '고양이오줌얼룩제거 스팀케어 현장사진', 0 from public.cases where slug = 'case-17';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-17-2.webp', '고양이오줌얼룩제거 스팀케어 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-17';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-18', '카페트얼룩제거 스팀케어 작업', '소파·매트리스·카펫', '작업지역 비공개', '카페트에 쌓인 먼지와 얼룩, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

카페트얼룩제거 스팀케어 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-18-1.webp', '카페트얼룩제거 스팀케어 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-18-1.webp', '카페트얼룩제거 스팀케어 작업 현장사진 1', '카페트얼룩제거 스팀케어 현장사진', 0 from public.cases where slug = 'case-18';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-18-2.webp', '카페트얼룩제거 스팀케어 작업 현장사진 2', '카페트 관리 작업 장면', 1 from public.cases where slug = 'case-18';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-19', '피부과 소파 스팀 클리닝 작업', '소파·매트리스·카펫', '작업지역 비공개', '피부과 소파 스팀의 먼지와 생활오염을 확인하고 패브릭 표면을 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

피부과 소파 스팀케어 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-19-1.webp', '피부과 소파 스팀 클리닝 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-19-1.webp', '피부과 소파 스팀 클리닝 작업 현장사진 1', '피부과 소파 스팀 클리닝 현장', 0 from public.cases where slug = 'case-19';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-19-2.webp', '피부과 소파 스팀 클리닝 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-19';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-20', '8인용소파 클리닝 작업', '소파·매트리스·카펫', '작업지역 비공개', '8인용소파의 먼지와 생활오염을 확인하고 패브릭 표면을 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

8인용소파케어 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-20-1.webp', '8인용소파 클리닝 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-20-1.webp', '8인용소파 클리닝 작업 현장사진 1', '8인용소파 클리닝 현장', 0 from public.cases where slug = 'case-20';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-20-2.webp', '8인용소파 클리닝 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-20';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-21', '영종도 매트리스케어 작업', '소파·매트리스·카펫', '영종도', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 영종도에서 진행한 소파·매트리스·카펫 관련 청소 작업입니다.

영종도 매트리스케어 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-21-1.webp', '영종도 매트리스케어 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-21-1.webp', '영종도 매트리스케어 작업 현장사진 1', '영종도 매트리스케어 현장사진', 0 from public.cases where slug = 'case-21';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-21-2.webp', '영종도 매트리스케어 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-21';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-22', '카페트 스팀케어 작업', '소파·매트리스·카펫', '작업지역 비공개', '카페트에 쌓인 먼지와 얼룩, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

카페트 스팀케어 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-22-1.webp', '카페트 스팀케어 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-22-1.webp', '카페트 스팀케어 작업 현장사진 1', '카페트 스팀케어 현장사진', 0 from public.cases where slug = 'case-22';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-22-2.webp', '카페트 스팀케어 작업 현장사진 2', '카페트 관리 작업 장면', 1 from public.cases where slug = 'case-22';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-23', '강아지 오줌얼룩케어 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

강아지 오줌얼룩케어 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-23-1.webp', '강아지 오줌얼룩케어 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-23-1.webp', '강아지 오줌얼룩케어 작업 현장사진 1', '강아지 오줌얼룩케어 현장사진', 0 from public.cases where slug = 'case-23';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-23-2.webp', '강아지 오줌얼룩케어 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-23';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-24', '이사후 매트리스케어 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

이사후 매트리스케어 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-24-1.webp', '이사후 매트리스케어 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-24-1.webp', '이사후 매트리스케어 작업 현장사진 1', '이사후 매트리스케어 현장사진', 0 from public.cases where slug = 'case-24';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-24-2.webp', '이사후 매트리스케어 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-24';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-25', '기존매트리스 습식케어 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

기존매트리스 습식케어 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-25-1.webp', '기존매트리스 습식케어 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-25-1.webp', '기존매트리스 습식케어 작업 현장사진 1', '기존매트리스 습식케어 현장사진', 0 from public.cases where slug = 'case-25';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-25-2.webp', '기존매트리스 습식케어 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-25';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-26', '두아이 가족 오줌 얼룩제거 싱글 킹사이즈 스팀케어 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

두아이 가족 오줌 얼룩제거 싱글 킹사이즈 스팀케어 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-26-1.webp', '두아이 가족 오줌 얼룩제거 싱글 킹사이즈 스팀케어 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-26-1.webp', '두아이 가족 오줌 얼룩제거 싱글 킹사이즈 스팀케어 작업 현장사진 1', '두아이 가족 오줌 얼룩제거 싱글 킹사이즈 스팀케어 현장사진', 0 from public.cases where slug = 'case-26';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-26-2.webp', '두아이 가족 오줌 얼룩제거 싱글 킹사이즈 스팀케어 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-26';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-27', '이사후 매트리스 얼룩케어 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

이사후 매트리스 얼룩케어 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-27-1.webp', '이사후 매트리스 얼룩케어 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-27-1.webp', '이사후 매트리스 얼룩케어 작업 현장사진 1', '이사후 매트리스 얼룩케어 현장사진', 0 from public.cases where slug = 'case-27';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-27-2.webp', '이사후 매트리스 얼룩케어 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-27';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-28', '곰팡이제거 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

곰팡이제거 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-28-1.webp', '곰팡이제거 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-28-1.webp', '곰팡이제거 작업 현장사진 1', '곰팡이제거 현장사진', 0 from public.cases where slug = 'case-28';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-28-2.webp', '곰팡이제거 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-28';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-29', '고양이오줌얼룩제거 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

고양이오줌얼룩제거 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-29-1.webp', '고양이오줌얼룩제거 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-29-1.webp', '고양이오줌얼룩제거 작업 현장사진 1', '고양이오줌얼룩제거 현장사진', 0 from public.cases where slug = 'case-29';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-29-2.webp', '고양이오줌얼룩제거 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-29';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-30', '강아지오줌 똥 얼룩제거 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

강아지오줌 똥 얼룩제거 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-30-1.webp', '강아지오줌 똥 얼룩제거 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-30-1.webp', '강아지오줌 똥 얼룩제거 작업 현장사진 1', '강아지오줌 똥 얼룩제거 현장사진', 0 from public.cases where slug = 'case-30';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-30-2.webp', '강아지오줌 똥 얼룩제거 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-30';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-31', '강아지오줌제거 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

강아지오줌제거 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-31-1.webp', '강아지오줌제거 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-31-1.webp', '강아지오줌제거 작업 현장사진 1', '강아지오줌제거 현장사진', 0 from public.cases where slug = 'case-31';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-31-2.webp', '강아지오줌제거 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-31';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-32', '소파 리클라이너 클리닝 작업', '소파·매트리스·카펫', '작업지역 비공개', '소파 리클라이너의 먼지와 생활오염을 확인하고 패브릭 표면을 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

소파 리클라이너 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-32-1.webp', '소파 리클라이너 클리닝 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-32-1.webp', '소파 리클라이너 클리닝 작업 현장사진 1', '소파 리클라이너 클리닝 현장', 0 from public.cases where slug = 'case-32';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-32-2.webp', '소파 리클라이너 클리닝 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-32';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-33', '오줌제거 스팀케어 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

오줌제거 스팀케어 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-33-1.webp', '오줌제거 스팀케어 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-33-1.webp', '오줌제거 스팀케어 작업 현장사진 1', '오줌제거 스팀케어 현장사진', 0 from public.cases where slug = 'case-33';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-33-2.webp', '오줌제거 스팀케어 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-33';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-34', '오줌 얼룩제거 습식케어 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

오줌 얼룩제거 습식케어 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-34-1.webp', '오줌 얼룩제거 습식케어 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-34-1.webp', '오줌 얼룩제거 습식케어 작업 현장사진 1', '오줌 얼룩제거 습식케어 현장사진', 0 from public.cases where slug = 'case-34';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-34-2.webp', '오줌 얼룩제거 습식케어 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-34';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-35', '카페트 오염 냄새제거 작업', '소파·매트리스·카펫', '작업지역 비공개', '카페트에 쌓인 먼지와 얼룩, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

카페트 오염 냄새제거 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-35-1.webp', '카페트 오염 냄새제거 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-35-1.webp', '카페트 오염 냄새제거 작업 현장사진 1', '카페트 오염 냄새제거 현장사진', 0 from public.cases where slug = 'case-35';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-35-2.webp', '카페트 오염 냄새제거 작업 현장사진 2', '카페트 관리 작업 장면', 1 from public.cases where slug = 'case-35';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-36', '강아지오줌얼룩제거 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

강아지오줌얼룩제거 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-36-1.webp', '강아지오줌얼룩제거 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-36-1.webp', '강아지오줌얼룩제거 작업 현장사진 1', '강아지오줌얼룩제거 현장사진', 0 from public.cases where slug = 'case-36';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-36-2.webp', '강아지오줌얼룩제거 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-36';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-37', '카페트 전체 오염도 냄새제거 스팀케어 작업', '소파·매트리스·카펫', '작업지역 비공개', '카페트에 쌓인 먼지와 얼룩, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

카페트 전체 오염도 냄새재거 스팀케어 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-37-1.webp', '카페트 전체 오염도 냄새제거 스팀케어 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-37-1.webp', '카페트 전체 오염도 냄새제거 스팀케어 작업 현장사진 1', '카페트 전체 오염도 냄새제거 스팀케어 현장사진', 0 from public.cases where slug = 'case-37';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-37-2.webp', '카페트 전체 오염도 냄새제거 스팀케어 작업 현장사진 2', '카페트 관리 작업 장면', 1 from public.cases where slug = 'case-37';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-38', '소파4인용 스팀 클리닝 작업', '소파·매트리스·카펫', '작업지역 비공개', '소파4인용 스팀의 먼지와 생활오염을 확인하고 패브릭 표면을 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

소파4인용 스팀케어 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-38-1.webp', '소파4인용 스팀 클리닝 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-38-1.webp', '소파4인용 스팀 클리닝 작업 현장사진 1', '소파4인용 스팀 클리닝 현장', 0 from public.cases where slug = 'case-38';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-38-2.webp', '소파4인용 스팀 클리닝 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-38';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-39', '퀸사이즈 매트리스 오염도제거 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

퀸사이즈 매트리스 오염도제거 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-39-1.webp', '퀸사이즈 매트리스 오염도제거 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-39-1.webp', '퀸사이즈 매트리스 오염도제거 작업 현장사진 1', '퀸사이즈 매트리스 오염도제거 현장사진', 0 from public.cases where slug = 'case-39';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-39-2.webp', '퀸사이즈 매트리스 오염도제거 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-39';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-40', '연남동 스튜디오 12평 카페트 스팀케어 작업', '소파·매트리스·카펫', '연남동', '카페트에 쌓인 먼지와 얼룩, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 연남동에서 진행한 소파·매트리스·카펫 관련 청소 작업입니다.

연남동 스튜디오 12평 카페트 스팀 케어 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-40-1.webp', '연남동 스튜디오 12평 카페트 스팀케어 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-40-1.webp', '연남동 스튜디오 12평 카페트 스팀케어 작업 현장사진 1', '연남동 스튜디오 12평 카페트 스팀케어 현장사진', 0 from public.cases where slug = 'case-40';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-40-2.webp', '연남동 스튜디오 12평 카페트 스팀케어 작업 현장사진 2', '카페트 관리 작업 장면', 1 from public.cases where slug = 'case-40';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-41', '강아지 오줌 얼룩제거 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

강아지 오줌 얼룩제거 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-41-1.webp', '강아지 오줌 얼룩제거 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-41-1.webp', '강아지 오줌 얼룩제거 작업 현장사진 1', '강아지 오줌 얼룩제거 현장사진', 0 from public.cases where slug = 'case-41';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-41-2.webp', '강아지 오줌 얼룩제거 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-41';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-42', '아이오줌얼룩제거 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

아이오줌얼룩제거 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-42-1.webp', '아이오줌얼룩제거 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-42-1.webp', '아이오줌얼룩제거 작업 현장사진 1', '아이오줌얼룩제거 현장사진', 0 from public.cases where slug = 'case-42';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-42-2.webp', '아이오줌얼룩제거 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-42';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-43', '영등포 상업공간 바닥 세척 작업', '상가·사무실', '영등포', '영업공간 바닥의 오염과 사용 흔적을 정리한 현장입니다.', '이번 현장은 영등포에서 진행한 상가·사무실 관련 청소 작업입니다.

영등포 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-43-1.webp', '영등포 상업공간 바닥 세척 작업 대표 현장사진', false, 'published', '/services/office/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-43-1.webp', '영등포 상업공간 바닥 세척 작업 현장사진 1', '상업공간 바닥 세척 현장', 0 from public.cases where slug = 'case-43';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-43-2.webp', '영등포 상업공간 바닥 세척 작업 현장사진 2', '바닥 청소 작업 장면', 1 from public.cases where slug = 'case-43';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-44', '소파 클리닝 작업', '소파·매트리스·카펫', '작업지역 비공개', '소파의 먼지와 생활오염을 확인하고 패브릭 표면을 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

소파 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-44-1.webp', '소파 클리닝 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-44-1.webp', '소파 클리닝 작업 현장사진 1', '소파 클리닝 현장', 0 from public.cases where slug = 'case-44';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-44-2.webp', '소파 클리닝 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-44';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-45', '오줌얼룩제거 작업', '소파·매트리스·카펫', '작업지역 비공개', '매트리스와 패브릭에 남은 얼룩, 오염, 생활 냄새를 중심으로 관리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 소파·매트리스·카펫 관련 청소 작업입니다.

오줌얼룩제거 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-45-1.webp', '오줌얼룩제거 작업 대표 현장사진', false, 'published', '/home-care/fabric/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-45-1.webp', '오줌얼룩제거 작업 현장사진 1', '오줌얼룩제거 현장사진', 0 from public.cases where slug = 'case-45';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-45-2.webp', '오줌얼룩제거 작업 현장사진 2', '패브릭 케어 작업 장면', 1 from public.cases where slug = 'case-45';
insert into public.cases (slug, title, service, region, summary, work_content, cover_image_path, cover_image_alt, is_featured, status, related_service_path, source, published_at)
values ('case-46', '주방 바닥 및 실내 청소 작업', '급식실·주방', '작업지역 비공개', '실내 바닥과 주방 주변 오염을 정리한 현장입니다.', '이번 현장은 작업지역을 공개하지 않는 급식실·주방 관련 청소 작업입니다.

작업 요청에 맞춰 현장 상태를 먼저 확인하고, 오염이 눈에 띄는 부분을 중심으로 작업 범위를 정리했습니다.

현장사진을 기준으로 필요한 구역을 나누어 먼지, 얼룩, 생활오염을 차분히 관리했습니다.

작업 후에는 사용에 불편함이 없도록 표면 상태와 주변 정리 상태를 확인하며 마무리했습니다.', '/public/images/case-work/work-46-1.webp', '주방 바닥 및 실내 청소 작업 대표 현장사진', false, 'published', '/services/kitchen/', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set title = excluded.title, service = excluded.service, region = excluded.region, summary = excluded.summary, work_content = excluded.work_content, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, is_featured = excluded.is_featured, status = excluded.status, related_service_path = excluded.related_service_path, source = excluded.source, published_at = excluded.published_at;
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-46-1.webp', '주방 바닥 및 실내 청소 작업 현장사진 1', '실내 청소 작업 장면', 0 from public.cases where slug = 'case-46';
insert into public.case_images (case_id, storage_path, alt_text, caption, sort_order)
select id, '/public/images/case-work/work-46-2.webp', '주방 바닥 및 실내 청소 작업 현장사진 2', '청소 후 정돈된 현장', 1 from public.cases where slug = 'case-46';
insert into public.cleaning_posts (slug, title, category, cover_image_path, cover_image_alt, summary, body, tags, related_service_path, is_featured, status, source, published_at)
values ('office-floor-care', '사무실 바닥을 깨끗하게 오래 유지하는 관리 방법', '사무실·상가 관리', '/public/images/cleaning-info/office-floor-care.webp', '사무실 바닥을 깨끗하게 오래 유지하는 관리 방법 대표 이미지', '사무실 바닥은 매일 오가는 동선과 의자 바퀴 때문에 오염이 빠르게 쌓입니다. 관리 주기와 기본 습관을 알면 깨끗함을 오래 유지할 수 있습니다.', '[]'::jsonb, array['사무실', '바닥관리', '정기청소'], '/services/office/', true, 'published', 'migrated', '2026-10-05'::timestamptz)
on conflict (slug) do update set title = excluded.title, category = excluded.category, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, summary = excluded.summary, tags = excluded.tags, related_service_path = excluded.related_service_path, is_featured = excluded.is_featured, status = excluded.status, source = excluded.source, published_at = excluded.published_at;
insert into public.cleaning_posts (slug, title, category, cover_image_path, cover_image_alt, summary, body, tags, related_service_path, is_featured, status, source, published_at)
values ('floor-wax-timing', '바닥 왁스코팅이 필요한 시기와 확인 방법', '바닥·왁스 관리', '/public/images/cleaning-info/floor-wax-timing.webp', '바닥 왁스코팅이 필요한 시기와 확인 방법 대표 이미지', '왁스코팅은 광택만을 위한 작업이 아니라 바닥 표면을 보호하는 관리 방법입니다. 필요한 시기를 확인하는 기준을 정리했습니다.', '[]'::jsonb, array['왁스코팅', '바닥청소', '상가관리'], '/services/floor-wax/', false, 'published', 'migrated', '2026-10-05'::timestamptz)
on conflict (slug) do update set title = excluded.title, category = excluded.category, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, summary = excluded.summary, tags = excluded.tags, related_service_path = excluded.related_service_path, is_featured = excluded.is_featured, status = excluded.status, source = excluded.source, published_at = excluded.published_at;
insert into public.cleaning_posts (slug, title, category, cover_image_path, cover_image_alt, summary, body, tags, related_service_path, is_featured, status, source, published_at)
values ('restroom-odor', '화장실 냄새가 반복되는 주요 원인과 관리법', '화장실 관리', '/public/images/cleaning-info/restroom-odor.webp', '화장실 냄새가 반복되는 주요 원인과 관리법 대표 이미지', '화장실 냄새는 표면 오염만이 아니라 배수구, 환기, 줄눈 오염이 함께 영향을 줄 수 있습니다. 반복되는 냄새의 원인을 나눠 봅니다.', '[]'::jsonb, array['화장실', '냄새관리', '배수구'], '/services/restroom/', false, 'published', 'migrated', '2026-10-05'::timestamptz)
on conflict (slug) do update set title = excluded.title, category = excluded.category, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, summary = excluded.summary, tags = excluded.tags, related_service_path = excluded.related_service_path, is_featured = excluded.is_featured, status = excluded.status, source = excluded.source, published_at = excluded.published_at;
insert into public.cleaning_posts (slug, title, category, cover_image_path, cover_image_alt, summary, body, tags, related_service_path, is_featured, status, source, published_at)
values ('window-water-spots', '유리창에 물자국이 남지 않게 청소하는 방법', '유리창 관리', '/public/images/cleaning-info/window-water-spots.webp', '유리창에 물자국이 남지 않게 청소하는 방법 대표 이미지', '유리창 물자국은 물기 제거 타이밍과 도구 선택에 따라 달라집니다. 맑은 창을 유지하는 기본 순서를 안내합니다.', '[]'::jsonb, array['유리창', '물자국', '창틀관리'], '/services/window/', false, 'published', 'migrated', '2026-10-05'::timestamptz)
on conflict (slug) do update set title = excluded.title, category = excluded.category, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, summary = excluded.summary, tags = excluded.tags, related_service_path = excluded.related_service_path, is_featured = excluded.is_featured, status = excluded.status, source = excluded.source, published_at = excluded.published_at;
insert into public.cleaning_posts (slug, title, category, cover_image_path, cover_image_alt, summary, body, tags, related_service_path, is_featured, status, source, published_at)
values ('kitchen-grease-cleaning', '주방 기름때를 안전하게 제거하는 순서', '주방·위생 관리', '/public/images/cleaning-info/kitchen-grease-cleaning.webp', '주방 기름때를 안전하게 제거하는 순서 대표 이미지', '주방 기름때는 무리하게 문지르기보다 불림, 분리, 세척, 건조 순서를 지키는 것이 중요합니다. 안전한 관리 흐름을 정리했습니다.', '[]'::jsonb, array['주방', '기름때', '위생관리'], '/services/kitchen/', false, 'published', 'migrated', '2026-10-05'::timestamptz)
on conflict (slug) do update set title = excluded.title, category = excluded.category, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, summary = excluded.summary, tags = excluded.tags, related_service_path = excluded.related_service_path, is_featured = excluded.is_featured, status = excluded.status, source = excluded.source, published_at = excluded.published_at;
insert into public.cleaning_posts (slug, title, category, cover_image_path, cover_image_alt, summary, body, tags, related_service_path, is_featured, status, source, published_at)
values ('aircon-filter-care', '에어컨 필터 청소 주기와 관리 방법', '에어컨 관리', '/public/images/cleaning-info/aircon-filter-care.webp', '에어컨 필터 청소 주기와 관리 방법 대표 이미지', '에어컨 필터는 사용 전후와 사용량에 따라 관리 주기가 달라집니다. 직접 할 수 있는 범위와 전문가 상담이 필요한 경우를 구분합니다.', '[]'::jsonb, array['에어컨', '필터청소', '실내공기'], '/services/aircon/', false, 'published', 'migrated', '2026-10-05'::timestamptz)
on conflict (slug) do update set title = excluded.title, category = excluded.category, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, summary = excluded.summary, tags = excluded.tags, related_service_path = excluded.related_service_path, is_featured = excluded.is_featured, status = excluded.status, source = excluded.source, published_at = excluded.published_at;
insert into public.cleaning_posts (slug, title, category, cover_image_path, cover_image_alt, summary, body, tags, related_service_path, is_featured, status, source, published_at)
values ('move-in-checklist', '입주청소 전에 확인해야 할 체크리스트', '입주·이사 관리', '/public/images/cleaning-info/move-in-checklist.webp', '입주청소 전에 확인해야 할 체크리스트 대표 이미지', '입주청소는 짐이 들어오기 전 확인할수록 효율이 좋습니다. 창틀, 수납장, 욕실, 주방 등 사전 점검 항목을 정리했습니다.', '[]'::jsonb, array['입주청소', '체크리스트', '이사준비'], '/home-care/move-in/', false, 'published', 'migrated', '2026-10-05'::timestamptz)
on conflict (slug) do update set title = excluded.title, category = excluded.category, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, summary = excluded.summary, tags = excluded.tags, related_service_path = excluded.related_service_path, is_featured = excluded.is_featured, status = excluded.status, source = excluded.source, published_at = excluded.published_at;
insert into public.cleaning_posts (slug, title, category, cover_image_path, cover_image_alt, summary, body, tags, related_service_path, is_featured, status, source, published_at)
values ('dust-after-moving', '이사 후 먼지가 계속 나오는 이유', '입주·이사 관리', '/public/images/cleaning-info/dust-after-moving.webp', '이사 후 먼지가 계속 나오는 이유 대표 이미지', '이사 후 먼지는 박스, 가구 이동, 창틀과 몰딩 틈, 공사 잔먼지에서 반복될 수 있습니다. 원인별 관리 방법을 안내합니다.', '[]'::jsonb, array['이사청소', '먼지', '입주관리'], '/home-care/move-in/', false, 'published', 'migrated', '2026-10-05'::timestamptz)
on conflict (slug) do update set title = excluded.title, category = excluded.category, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, summary = excluded.summary, tags = excluded.tags, related_service_path = excluded.related_service_path, is_featured = excluded.is_featured, status = excluded.status, source = excluded.source, published_at = excluded.published_at;
insert into public.cleaning_posts (slug, title, category, cover_image_path, cover_image_alt, summary, body, tags, related_service_path, is_featured, status, source, published_at)
values ('sofa-mattress-habits', '소파와 매트리스의 오염을 줄이는 생활 습관', '생활 청소 팁', '/public/images/cleaning-info/sofa-mattress-habits.webp', '소파와 매트리스의 오염을 줄이는 생활 습관 대표 이미지', '소파와 매트리스는 피부, 먼지, 습기, 생활 냄새가 누적되기 쉽습니다. 일상에서 오염을 줄이는 습관을 정리했습니다.', '[]'::jsonb, array['소파', '매트리스', '생활관리'], '/home-care/fabric/', false, 'published', 'migrated', '2026-10-05'::timestamptz)
on conflict (slug) do update set title = excluded.title, category = excluded.category, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, summary = excluded.summary, tags = excluded.tags, related_service_path = excluded.related_service_path, is_featured = excluded.is_featured, status = excluded.status, source = excluded.source, published_at = excluded.published_at;
insert into public.cleaning_posts (slug, title, category, cover_image_path, cover_image_alt, summary, body, tags, related_service_path, is_featured, status, source, published_at)
values ('rainy-mold-humidity', '장마철 곰팡이와 습기를 관리하는 방법', '생활 청소 팁', '/public/images/cleaning-info/rainy-mold-humidity.webp', '장마철 곰팡이와 습기를 관리하는 방법 대표 이미지', '습도가 높은 시기에는 환기, 물기 제거, 가구 배치가 중요합니다. 곰팡이를 줄이기 위한 생활 관리 방법을 안내합니다.', '[]'::jsonb, array['곰팡이', '습기', '장마철'], '/home-care/', false, 'published', 'migrated', '2026-10-05'::timestamptz)
on conflict (slug) do update set title = excluded.title, category = excluded.category, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, summary = excluded.summary, tags = excluded.tags, related_service_path = excluded.related_service_path, is_featured = excluded.is_featured, status = excluded.status, source = excluded.source, published_at = excluded.published_at;
insert into public.cleaning_posts (slug, title, category, cover_image_path, cover_image_alt, summary, body, tags, related_service_path, is_featured, status, source, published_at)
values ('cleaner-mixing-danger', '청소 세제를 섞어 사용하면 안 되는 이유', '생활 청소 팁', '/public/images/cleaning-info/cleaner-mixing-danger.webp', '청소 세제를 섞어 사용하면 안 되는 이유 대표 이미지', '세제를 섞으면 예상하지 못한 냄새나 자극이 생길 수 있습니다. 안전하게 청소하기 위한 기본 원칙을 설명합니다.', '[]'::jsonb, array['세제', '안전', '청소주의사항'], '/contact/', false, 'published', 'migrated', '2026-10-05'::timestamptz)
on conflict (slug) do update set title = excluded.title, category = excluded.category, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, summary = excluded.summary, tags = excluded.tags, related_service_path = excluded.related_service_path, is_featured = excluded.is_featured, status = excluded.status, source = excluded.source, published_at = excluded.published_at;
insert into public.cleaning_posts (slug, title, category, cover_image_path, cover_image_alt, summary, body, tags, related_service_path, is_featured, status, source, published_at)
values ('diy-vs-professional-cleaning', '직접 청소와 전문 청소를 구분하는 기준', '생활 청소 팁', '/public/images/cleaning-info/diy-vs-professional-cleaning.webp', '직접 청소와 전문 청소를 구분하는 기준 대표 이미지', '일상 관리는 직접 할 수 있지만 장비, 높이, 오염 정도에 따라 전문가 도움이 필요한 경우가 있습니다. 판단 기준을 정리했습니다.', '[]'::jsonb, array['전문청소', '셀프청소', '상담기준'], '/services/', false, 'published', 'migrated', '2026-10-05'::timestamptz)
on conflict (slug) do update set title = excluded.title, category = excluded.category, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, summary = excluded.summary, tags = excluded.tags, related_service_path = excluded.related_service_path, is_featured = excluded.is_featured, status = excluded.status, source = excluded.source, published_at = excluded.published_at;
insert into public.cleaning_posts (slug, legacy_path, title, category, cover_image_path, cover_image_alt, summary, body, tags, related_service_path, related_case_slugs, is_featured, status, source, published_at)
values ('cleaning-estimate-criteria', '/guide/cleaning-estimate-criteria/', '청소 견적은 어떤 기준으로 결정될까요?', '청소 준비·이용안내', '/public/images/services-hero-comprehensive-v1.webp', '청소 견적은 어떤 기준으로 결정될까요? 설명 이미지', '면적만이 아니라 오염 정도, 작업 범위, 장비 사용, 일정 조건을 함께 봐야 견적이 달라집니다.', '[{"type":"paragraph","sortOrder":0,"text":"견적은 면적 하나로 정해지기보다 공간의 용도, 오염 정도, 작업 높이, 장비 진입 조건, 작업 시간대가 함께 반영됩니다."},{"type":"paragraph","sortOrder":1,"text":"사진 상담을 받을 때는 전체 공간 사진, 오염이 심한 부분, 물과 전기 사용 가능 여부, 주차와 출입 조건을 함께 보내주면 좋습니다."},{"type":"paragraph","sortOrder":2,"text":"직접 준비할 것은 귀중품 보관, 파손 위험 물품 이동, 작업 동선 확보입니다. 무거운 집기 이동이 필요한 경우에는 상담 때 미리 알려주세요."},{"type":"paragraph","sortOrder":3,"text":"전문 장비가 필요한 바닥 세척, 고소 유리창, 에어컨 분해, 강한 기름때 작업은 현장 확인 후 가능 범위를 안내받는 것이 안전합니다."}]'::jsonb, array[], '/contact/', array['case-02'], false, 'published', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set legacy_path = excluded.legacy_path, title = excluded.title, category = excluded.category, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, summary = excluded.summary, body = excluded.body, related_service_path = excluded.related_service_path, related_case_slugs = excluded.related_case_slugs, status = excluded.status, source = excluded.source, published_at = excluded.published_at;
insert into public.cleaning_posts (slug, legacy_path, title, category, cover_image_path, cover_image_alt, summary, body, tags, related_service_path, related_case_slugs, is_featured, status, source, published_at)
values ('photo-estimate-guide', '/guide/photo-estimate-guide/', '현장사진만으로 청소 견적을 받을 수 있나요?', '청소 준비·이용안내', '/public/images/homecare-hero-clean-v1.webp', '현장사진만으로 청소 견적을 받을 수 있나요? 설명 이미지', '사진만으로 1차 상담은 가능하지만 최종 범위는 현장 조건에 따라 달라질 수 있습니다.', '[{"type":"paragraph","sortOrder":0,"text":"현장사진은 상담을 빠르게 시작하는 데 큰 도움이 됩니다. 다만 사진에 보이지 않는 냄새, 소재 손상, 물 사용 조건은 추가 확인이 필요합니다."},{"type":"paragraph","sortOrder":1,"text":"공간 전체가 보이는 사진, 오염 부위 근접 사진, 출입구와 작업 동선, 전기와 수도 위치를 함께 보내면 상담 정확도가 높아집니다."},{"type":"paragraph","sortOrder":2,"text":"사진 견적은 작업 가능 범위와 예상 준비사항을 안내하는 단계로 보고, 현장 상황에 따라 작업 방식이나 일정이 조정될 수 있습니다."},{"type":"paragraph","sortOrder":3,"text":"무리하게 확정 가격을 약속하기보다 확인이 필요한 항목을 투명하게 안내하는 업체를 선택하는 것이 좋습니다."}]'::jsonb, array[], '/contact/', array['case-03'], false, 'published', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set legacy_path = excluded.legacy_path, title = excluded.title, category = excluded.category, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, summary = excluded.summary, body = excluded.body, related_service_path = excluded.related_service_path, related_case_slugs = excluded.related_case_slugs, status = excluded.status, source = excluded.source, published_at = excluded.published_at;
insert into public.cleaning_posts (slug, legacy_path, title, category, cover_image_path, cover_image_alt, summary, body, tags, related_service_path, related_case_slugs, is_featured, status, source, published_at)
values ('choosing-cleaning-company', '/guide/choosing-cleaning-company/', '청소업체를 선택할 때 확인해야 할 기준', '청소 준비·이용안내', '/public/images/about-professional-team.svg', '청소업체를 선택할 때 확인해야 할 기준 설명 이미지', '작업 범위, 사진 상담 방식, 사후 확인 절차, 과장 표현 여부를 함께 확인하세요.', '[{"type":"paragraph","sortOrder":0,"text":"청소업체를 고를 때는 가격만 비교하기보다 어떤 구역을 어떤 순서로 작업하는지 설명할 수 있는지 확인해야 합니다."},{"type":"paragraph","sortOrder":1,"text":"모든 오염을 완전히 제거한다고 단정하거나 현장 확인 없이 과도하게 낮은 가격을 제시하는 경우에는 작업 범위를 다시 확인하는 편이 좋습니다."},{"type":"paragraph","sortOrder":2,"text":"작업 전후 확인 절차, 파손 위험 물품 안내, 작업 불가 항목 설명이 있는지 살펴보세요."},{"type":"paragraph","sortOrder":3,"text":"청년홈케어는 현장 사진과 공간 정보를 바탕으로 필요한 작업 범위를 먼저 상담하고, 확인이 필요한 정보는 임의로 단정하지 않습니다."}]'::jsonb, array[], '/about/', array[], false, 'published', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set legacy_path = excluded.legacy_path, title = excluded.title, category = excluded.category, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, summary = excluded.summary, body = excluded.body, related_service_path = excluded.related_service_path, related_case_slugs = excluded.related_case_slugs, status = excluded.status, source = excluded.source, published_at = excluded.published_at;
insert into public.cleaning_posts (slug, legacy_path, title, category, cover_image_path, cover_image_alt, summary, body, tags, related_service_path, related_case_slugs, is_featured, status, source, published_at)
values ('office-regular-cleaning-cycle', '/guide/office-regular-cleaning-cycle/', '사무실 정기청소는 얼마나 자주 해야 할까요?', '사무실·상가', '/public/images/services-regular-cleaning-v1.webp', '사무실 정기청소는 얼마나 자주 해야 할까요? 설명 이미지', '이용 인원, 바닥 소재, 화장실 사용량, 고객 방문 여부에 따라 주기가 달라집니다.', '[{"type":"paragraph","sortOrder":0,"text":"사무실 정기청소 주기는 공간을 사용하는 인원과 오염이 쌓이는 속도에 따라 달라집니다. 직원 수가 많거나 고객 방문이 잦은 공간은 관리 주기를 짧게 잡는 편이 좋습니다."},{"type":"paragraph","sortOrder":1,"text":"기본 관리는 바닥 먼지, 쓰레기, 책상 주변, 탕비실, 화장실 상태를 중심으로 봅니다. 바닥 광택이나 카펫 먼지처럼 누적되는 항목은 별도 주기로 계획합니다."},{"type":"paragraph","sortOrder":2,"text":"직접 관리할 때는 매일 쓰레기와 음식물 냄새를 먼저 줄이고, 주 1회 이상 바닥과 공용부를 확인하는 것이 도움이 됩니다."},{"type":"paragraph","sortOrder":3,"text":"정기청소 상담 시에는 공간 면적, 근무 인원, 원하는 요일과 시간, 우선 관리 구역을 알려주시면 좋습니다."}]'::jsonb, array[], '/services/regular/', array['case-02'], false, 'published', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set legacy_path = excluded.legacy_path, title = excluded.title, category = excluded.category, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, summary = excluded.summary, body = excluded.body, related_service_path = excluded.related_service_path, related_case_slugs = excluded.related_case_slugs, status = excluded.status, source = excluded.source, published_at = excluded.published_at;
insert into public.cleaning_posts (slug, legacy_path, title, category, cover_image_path, cover_image_alt, summary, body, tags, related_service_path, related_case_slugs, is_featured, status, source, published_at)
values ('office-cleaning-scope', '/guide/office-cleaning-scope/', '상가·사무실청소의 기본 작업범위', '사무실·상가', '/public/images/services-office-shop-v1.webp', '상가·사무실청소의 기본 작업범위 설명 이미지', '바닥, 집기, 유리, 출입 동선, 공용부를 중심으로 공간에 맞춰 작업 범위를 정합니다.', '[{"type":"paragraph","sortOrder":0,"text":"상가와 사무실은 고객과 직원이 함께 사용하는 공간이므로 첫인상과 동선 관리가 중요합니다."},{"type":"paragraph","sortOrder":1,"text":"기본 범위는 바닥 먼지와 얼룩, 출입문 주변, 상담실이나 회의실, 탕비실, 유리와 손잡이처럼 자주 만지는 부분입니다."},{"type":"paragraph","sortOrder":2,"text":"직접 청소할 때는 전자기기 주변 물 사용을 피하고, 바닥 소재에 맞지 않는 세제를 쓰지 않는 것이 중요합니다."},{"type":"paragraph","sortOrder":3,"text":"전문 작업이 필요한 경우는 바닥 왁스코팅, 대형 유리, 높은 곳 먼지, 장기간 누적된 오염처럼 일반 도구로 정리가 어려운 상황입니다."}]'::jsonb, array[], '/services/office/', array['case-02'], false, 'published', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set legacy_path = excluded.legacy_path, title = excluded.title, category = excluded.category, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, summary = excluded.summary, body = excluded.body, related_service_path = excluded.related_service_path, related_case_slugs = excluded.related_case_slugs, status = excluded.status, source = excluded.source, published_at = excluded.published_at;
insert into public.cleaning_posts (slug, legacy_path, title, category, cover_image_path, cover_image_alt, summary, body, tags, related_service_path, related_case_slugs, is_featured, status, source, published_at)
values ('floor-cleaning-wax-difference', '/guide/floor-cleaning-wax-difference/', '바닥청소와 왁스코팅은 무엇이 다를까요?', '바닥·왁스', '/public/images/services-floor-wax-v1.webp', '바닥청소와 왁스코팅은 무엇이 다를까요? 설명 이미지', '바닥청소는 오염 제거, 왁스코팅은 표면 보호와 광택 관리에 초점이 있습니다.', '[{"type":"paragraph","sortOrder":0,"text":"바닥청소는 먼지, 얼룩, 끈적임처럼 표면에 남은 오염을 정리하는 작업입니다. 왁스코팅은 세척 후 표면을 보호하고 광택을 더하는 관리 방식입니다."},{"type":"paragraph","sortOrder":1,"text":"왁스코팅이 항상 필요한 것은 아닙니다. 바닥 소재, 기존 코팅 상태, 보행량, 미끄럼 위험을 확인한 뒤 결정해야 합니다."},{"type":"paragraph","sortOrder":2,"text":"직접 관리할 때는 강한 세제를 반복 사용하거나 물을 오래 남겨두지 않는 것이 좋습니다. 소재에 맞지 않는 방법은 변색이나 들뜸을 만들 수 있습니다."},{"type":"paragraph","sortOrder":3,"text":"전문 상담에는 바닥 소재, 면적, 기존 코팅 여부, 광택 저하 사진, 작업 가능한 시간을 알려주시면 도움이 됩니다."}]'::jsonb, array[], '/services/floor-wax/', array['case-02'], false, 'published', 'migrated', '2026-10-04'::timestamptz)
on conflict (slug) do update set legacy_path = excluded.legacy_path, title = excluded.title, category = excluded.category, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, summary = excluded.summary, body = excluded.body, related_service_path = excluded.related_service_path, related_case_slugs = excluded.related_case_slugs, status = excluded.status, source = excluded.source, published_at = excluded.published_at;
insert into public.cleaning_posts (slug, legacy_path, title, category, cover_image_path, cover_image_alt, summary, body, tags, related_service_path, related_case_slugs, is_featured, status, source, published_at)
values ('restroom-odor-after-cleaning', '/guide/restroom-odor-after-cleaning/', '화장실 냄새가 청소 후에도 남는 이유', '화장실·주방', null, '화장실 냄새가 청소 후에도 남는 이유 설명 이미지', null, '[]'::jsonb, array[], null, array[], false, 'draft', 'migrated', null::timestamptz)
on conflict (slug) do update set legacy_path = excluded.legacy_path, title = excluded.title, category = excluded.category, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, summary = excluded.summary, body = excluded.body, related_service_path = excluded.related_service_path, related_case_slugs = excluded.related_case_slugs, status = excluded.status, source = excluded.source, published_at = excluded.published_at;
insert into public.cleaning_posts (slug, legacy_path, title, category, cover_image_path, cover_image_alt, summary, body, tags, related_service_path, related_case_slugs, is_featured, status, source, published_at)
values ('kitchen-hood-grease-care', '/guide/kitchen-hood-grease-care/', '주방 후드와 벽면 기름때 관리방법', '화장실·주방', null, '주방 후드와 벽면 기름때 관리방법 설명 이미지', null, '[]'::jsonb, array[], null, array[], false, 'draft', 'migrated', null::timestamptz)
on conflict (slug) do update set legacy_path = excluded.legacy_path, title = excluded.title, category = excluded.category, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, summary = excluded.summary, body = excluded.body, related_service_path = excluded.related_service_path, related_case_slugs = excluded.related_case_slugs, status = excluded.status, source = excluded.source, published_at = excluded.published_at;
insert into public.cleaning_posts (slug, legacy_path, title, category, cover_image_path, cover_image_alt, summary, body, tags, related_service_path, related_case_slugs, is_featured, status, source, published_at)
values ('aircon-filter-disassembly-difference', '/guide/aircon-filter-disassembly-difference/', '에어컨 필터청소와 분해청소의 차이', '유리창·에어컨', null, '에어컨 필터청소와 분해청소의 차이 설명 이미지', null, '[]'::jsonb, array[], null, array[], false, 'draft', 'migrated', null::timestamptz)
on conflict (slug) do update set legacy_path = excluded.legacy_path, title = excluded.title, category = excluded.category, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, summary = excluded.summary, body = excluded.body, related_service_path = excluded.related_service_path, related_case_slugs = excluded.related_case_slugs, status = excluded.status, source = excluded.source, published_at = excluded.published_at;
insert into public.cleaning_posts (slug, legacy_path, title, category, cover_image_path, cover_image_alt, summary, body, tags, related_service_path, related_case_slugs, is_featured, status, source, published_at)
values ('move-in-moving-cleaning-difference', '/guide/move-in-moving-cleaning-difference/', '입주청소와 이사청소의 차이', '입주·이사·준공', null, '입주청소와 이사청소의 차이 설명 이미지', null, '[]'::jsonb, array[], null, array[], false, 'draft', 'migrated', null::timestamptz)
on conflict (slug) do update set legacy_path = excluded.legacy_path, title = excluded.title, category = excluded.category, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, summary = excluded.summary, body = excluded.body, related_service_path = excluded.related_service_path, related_case_slugs = excluded.related_case_slugs, status = excluded.status, source = excluded.source, published_at = excluded.published_at;
insert into public.cleaning_posts (slug, legacy_path, title, category, cover_image_path, cover_image_alt, summary, body, tags, related_service_path, related_case_slugs, is_featured, status, source, published_at)
values ('move-in-cleaning-checklist', '/guide/move-in-cleaning-checklist/', '입주청소 완료 후 확인해야 할 점검표', '입주·이사·준공', null, '입주청소 완료 후 확인해야 할 점검표 설명 이미지', null, '[]'::jsonb, array[], null, array[], false, 'draft', 'migrated', null::timestamptz)
on conflict (slug) do update set legacy_path = excluded.legacy_path, title = excluded.title, category = excluded.category, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, summary = excluded.summary, body = excluded.body, related_service_path = excluded.related_service_path, related_case_slugs = excluded.related_case_slugs, status = excluded.status, source = excluded.source, published_at = excluded.published_at;
insert into public.cleaning_posts (slug, legacy_path, title, category, cover_image_path, cover_image_alt, summary, body, tags, related_service_path, related_case_slugs, is_featured, status, source, published_at)
values ('fabric-cleaning-timing', '/guide/fabric-cleaning-timing/', '소파와 매트리스청소가 필요한 시기', '소파·매트리스·카펫', null, '소파와 매트리스청소가 필요한 시기 설명 이미지', null, '[]'::jsonb, array[], null, array[], false, 'draft', 'migrated', null::timestamptz)
on conflict (slug) do update set legacy_path = excluded.legacy_path, title = excluded.title, category = excluded.category, cover_image_path = excluded.cover_image_path, cover_image_alt = excluded.cover_image_alt, summary = excluded.summary, body = excluded.body, related_service_path = excluded.related_service_path, related_case_slugs = excluded.related_case_slugs, status = excluded.status, source = excluded.source, published_at = excluded.published_at;
insert into public.faqs (question, answer, category, sort_order, status, show_on_home, source)
values ('서울·경기·인천 전 지역에 출장 가능한가요?', '네. 서울·경기·인천 전 지역 상담이 가능하며, 일정과 작업 범위에 따라 방문 시간을 안내합니다.', '서비스', 0, 'published', true, 'migrated');
insert into public.faqs (question, answer, category, sort_order, status, show_on_home, source)
values ('견적은 어떻게 결정되나요?', '공간 면적, 오염 정도, 작업 높이, 장비 진입 가능 여부, 작업 시간 등을 기준으로 안내합니다.', '견적', 1, 'published', true, 'migrated');
insert into public.faqs (question, answer, category, sort_order, status, show_on_home, source)
values ('현장 방문 없이 견적을 받을 수 있나요?', '현장 사진과 기본 정보를 보내주시면 1차 상담이 가능하며, 필요 시 방문 확인 후 최종 견적을 안내합니다.', '견적', 2, 'published', true, 'migrated');
insert into public.faqs (question, answer, category, sort_order, status, show_on_home, source)
values ('청소 전에 무엇을 준비해야 하나요?', '귀중품과 파손 위험 물품은 미리 보관해 주시고, 작업이 필요한 공간은 가능한 비워두시면 좋습니다.', '작업 준비', 3, 'published', true, 'migrated');
insert into public.faqs (question, answer, category, sort_order, status, show_on_home, source)
values ('작업 시간은 보통 얼마나 걸리나요?', '공간 크기와 오염 상태에 따라 다르며, 상담 시 예상 작업 시간을 함께 안내합니다.', '일정', 4, 'published', true, 'migrated');
insert into public.faqs (question, answer, category, sort_order, status, show_on_home, source)
values ('주말이나 야간 작업도 가능한가요?', '가능 일정이 있는 경우 조율해 드립니다. 상가나 사무실은 영업 시간 이후 작업도 상담 가능합니다.', '일정', 5, 'published', true, 'migrated');
insert into public.faqs (question, answer, category, sort_order, status, show_on_home, source)
values ('사무실 청소는 업무 시간 외에도 가능한가요?', '네. 퇴근 후나 휴무일 작업이 필요한 경우 일정 조율 후 진행할 수 있습니다.', '일정', 6, 'published', false, 'migrated');
insert into public.faqs (question, answer, category, sort_order, status, show_on_home, source)
values ('바닥 왁스코팅은 어떤 공간에 적합한가요?', '사무실, 상가, 복도, 병원, 학원 등 바닥 광택과 보호가 필요한 공간에 적합합니다.', '서비스', 7, 'published', false, 'migrated');
insert into public.faqs (question, answer, category, sort_order, status, show_on_home, source)
values ('화장실 냄새와 물때 제거도 가능한가요?', '오염 상태를 확인한 뒤 세면대, 변기, 바닥, 벽면, 배수구 주변을 중심으로 작업합니다.', '서비스', 8, 'published', false, 'migrated');
insert into public.faqs (question, answer, category, sort_order, status, show_on_home, source)
values ('유리창 청소는 높은 곳도 가능한가요?', '작업 높이와 안전 조건을 확인한 뒤 가능 여부를 안내합니다.', '서비스', 9, 'published', false, 'migrated');
insert into public.faqs (question, answer, category, sort_order, status, show_on_home, source)
values ('에어컨 청소는 언제 하는 것이 좋나요?', '사용 전 시즌, 냄새가 날 때, 먼지가 보일 때, 장기간 사용 후에 청소를 권장합니다.', '서비스', 10, 'published', false, 'migrated');
insert into public.faqs (question, answer, category, sort_order, status, show_on_home, source)
values ('입주·이사청소는 어느 범위까지 하나요?', '바닥, 창틀, 욕실, 주방, 수납장 외부 등 입주 전 확인이 필요한 구역을 중심으로 진행합니다.', '서비스', 11, 'published', false, 'migrated');
insert into public.faqs (question, answer, category, sort_order, status, show_on_home, source)
values ('주방이나 급식실 기름때도 제거 가능한가요?', '후드, 벽면, 조리대, 바닥 등 기름 오염 구역을 확인하고 적합한 세정 방식으로 작업합니다.', '서비스', 12, 'published', false, 'migrated');
insert into public.faqs (question, answer, category, sort_order, status, show_on_home, source)
values ('소파·매트리스 케어는 어떤 경우에 필요할까요?', '생활 냄새, 먼지, 패브릭 오염, 오래 사용한 침구류 관리가 필요할 때 상담 가능합니다.', '서비스', 13, 'published', false, 'migrated');
insert into public.faqs (question, answer, category, sort_order, status, show_on_home, source)
values ('청소 후 확인은 어떻게 진행하나요?', '작업 완료 후 주요 구역을 함께 확인하고, 필요한 부분은 현장에서 안내드립니다.', '사후관리', 14, 'published', false, 'migrated');
commit;