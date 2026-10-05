# 청년홈케어 관리자형 게시판 / 비공개 문의 1차 구현 메모

작성일: 2026-10-06
현재 단계: Supabase 기반 데이터 구조, 보안 정책, 이전 계획 준비

## 적용 원칙

- 기존 홈페이지 디자인과 URL을 최대한 유지한다.
- 기존 콘텐츠는 삭제하지 않고 JSON 백업 후 DB로 이전한다.
- 문의 내용과 첨부 이미지는 공개 페이지, sitemap, 검색엔진에 노출하지 않는다.
- 관리자 계정과 service role key는 코드에 쓰지 않는다.
- 실제 Supabase 값은 `.env.example`에 이름만 두고 Vercel 환경변수로 등록한다.

## 생성한 파일

- `.env.example`
- `supabase/migrations/202610060010_admin_board_schema.sql`
- `docs/admin-board-implementation.md`

## Supabase 구성 요약

### Database

- `admin_profiles`: 관리자 권한 프로필
- `categories`: 카테고리 관리
- `cases`, `case_images`: 시공사례
- `cleaning_posts`, `cleaning_post_images`: 청소정보
- `notices`: 공지사항
- `inquiries`, `inquiry_images`: 비공개 견적/1:1 문의
- `reviews`, `review_images`: 승인형 고객후기
- `faqs`: FAQ

### Storage buckets

- `public-content-images`: 공개 글 이미지
- `inquiry-attachments`: 문의 첨부 이미지, private
- `review-images`: 후기 이미지, 초기 private

### RLS 방향

- 공개 페이지는 `status = 'published'`인 글만 읽는다.
- 문의는 누구나 insert 가능하지만 public select는 없다.
- 관리자만 문의 목록/메모/상태/첨부 이미지를 확인한다.
- 관리자 판정은 `admin_profiles`와 `app_private.is_admin()` 함수로 한다.
- Supabase service role key는 문의 이미지 업로드 같은 서버 route에서만 사용한다.

## 기존 콘텐츠 이전 대상

| 콘텐츠 | 현재 위치 | 이전 테이블 | 처리 |
|---|---|---|---|
| 시공사례 46개 공개 + 1개 draft | `content/cases.json` | `cases`, `case_images` | JSON seed로 이전 |
| 메인 최근 작업현장 3개 | `content/cases.json` featured | `cases.is_featured` | 값 유지 |
| 청소정보 12개 | `content/cleaning-info.json` | `cleaning_posts` | body JSON 생성 필요 |
| `/guide` 공개 6개 + draft 6개 | `content/guides.json` | `cleaning_posts` | `legacy_path`로 `/guide/...` 보존 |
| FAQ | `index.html`, `faq/index.html` | `faqs` | 질문/답변 정규화 |
| 고객후기 샘플 | `index.html` REAL REVIEW | `reviews` | `source='sample'`, 승인 전 확인 필요 |

## 다음 단계

1. Next.js 전환 또는 Vercel Functions 병행 방식 최종 선택
2. 기존 HTML 공통 헤더/푸터를 컴포넌트화
3. Supabase client/server 연결 추가
4. 기존 콘텐츠 seed 스크립트 작성
5. `/support`, `/support/notices`, `/support/faq`, `/support/reviews` 추가
6. `/contact` 접수 폼과 `/contact/complete` 추가
7. `/admin` 로그인/대시보드/CRUD 추가
8. sitemap/canonical 실제 도메인 반영
9. 빌드와 권한 테스트

## 필요한 실제 값

채팅에 secret key를 보내지 말고, Vercel 환경변수에 등록한다.

- `NEXT_PUBLIC_SUPABASE_URL`
- `NEXT_PUBLIC_SUPABASE_ANON_KEY`
- `SUPABASE_SERVICE_ROLE_KEY`
- `ADMIN_NOTIFICATION_EMAIL`
- `RESEND_API_KEY` optional
- `TURNSTILE_SECRET_KEY` optional
- `NEXT_PUBLIC_TURNSTILE_SITE_KEY` optional

## 주의

마이그레이션 SQL은 Supabase SQL editor 또는 CLI에서 적용하기 전에 검토해야 한다. 적용 후 Supabase advisor/RLS 테스트를 돌리는 것이 좋다.
