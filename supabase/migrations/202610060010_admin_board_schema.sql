-- Cheongnyeon Homecare admin boards and private inquiry schema
-- Created for Supabase Postgres. Review in Supabase SQL editor before applying.
-- Do not put secret keys in this file.

create extension if not exists pgcrypto;

create schema if not exists app_private;

create table if not exists public.admin_profiles (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null unique references auth.users(id) on delete cascade,
  display_name text,
  role text not null default 'editor' check (role in ('owner', 'admin', 'editor')),
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create or replace function app_private.is_admin()
returns boolean
language sql
security definer
stable
set search_path = public
as $$
  select exists (
    select 1
    from public.admin_profiles ap
    where ap.user_id = (select auth.uid())
      and ap.is_active = true
      and ap.role in ('owner', 'admin', 'editor')
  );
$$;

revoke all on function app_private.is_admin() from public;
grant execute on function app_private.is_admin() to authenticated;

create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

create table if not exists public.categories (
  id uuid primary key default gen_random_uuid(),
  type text not null check (type in ('case_service', 'cleaning_post', 'faq', 'review_service')),
  slug text not null,
  name text not null,
  sort_order integer not null default 0,
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (type, slug)
);

create table if not exists public.cases (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique,
  title text not null,
  service text not null,
  region text,
  work_date date,
  summary text,
  site_condition text,
  work_content text,
  equipment text,
  result text,
  cover_image_path text,
  cover_image_alt text,
  is_featured boolean not null default false,
  status text not null default 'draft' check (status in ('draft', 'published', 'private', 'archived')),
  related_service_path text,
  seo_title text,
  seo_description text,
  source text not null default 'admin' check (source in ('admin', 'migrated', 'sample')),
  deleted_at timestamptz,
  published_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.case_images (
  id uuid primary key default gen_random_uuid(),
  case_id uuid not null references public.cases(id) on delete cascade,
  storage_bucket text,
  storage_path text not null,
  alt_text text,
  caption text,
  sort_order integer not null default 0,
  created_at timestamptz not null default now()
);

create table if not exists public.cleaning_posts (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique,
  legacy_path text,
  title text not null,
  category text not null,
  cover_image_path text,
  cover_image_alt text,
  summary text,
  body jsonb not null default '[]'::jsonb,
  tags text[] not null default '{}',
  related_service_path text,
  related_case_slugs text[] not null default '{}',
  is_featured boolean not null default false,
  status text not null default 'draft' check (status in ('draft', 'published', 'private', 'archived')),
  seo_title text,
  seo_description text,
  source text not null default 'admin' check (source in ('admin', 'migrated', 'sample')),
  deleted_at timestamptz,
  published_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.cleaning_post_images (
  id uuid primary key default gen_random_uuid(),
  post_id uuid not null references public.cleaning_posts(id) on delete cascade,
  storage_bucket text,
  storage_path text not null,
  alt_text text,
  caption text,
  sort_order integer not null default 0,
  created_at timestamptz not null default now()
);

create table if not exists public.notices (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique,
  title text not null,
  body jsonb not null default '[]'::jsonb,
  is_important boolean not null default false,
  is_pinned boolean not null default false,
  status text not null default 'draft' check (status in ('draft', 'published', 'private', 'archived')),
  attachment_paths text[] not null default '{}',
  view_count integer not null default 0,
  deleted_at timestamptz,
  published_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.inquiries (
  id uuid primary key default gen_random_uuid(),
  receipt_no text not null unique default ('CHC-' || upper(substr(replace(gen_random_uuid()::text, '-', ''), 1, 12))),
  customer_name text not null,
  phone text not null,
  email text,
  cleaning_type text not null,
  region text not null,
  space_type text,
  area_size text,
  preferred_date text,
  message text not null,
  preferred_contact text not null default 'phone' check (preferred_contact in ('phone', 'sms', 'email', 'kakao')),
  privacy_agreed boolean not null default false,
  access_hash text,
  status text not null default 'new' check (status in ('new', 'reviewing', 'quoted', 'scheduled', 'completed', 'on_hold', 'closed')),
  admin_memo text,
  ip_hash text,
  user_agent text,
  deleted_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.inquiry_images (
  id uuid primary key default gen_random_uuid(),
  inquiry_id uuid not null references public.inquiries(id) on delete cascade,
  storage_bucket text not null default 'inquiry-attachments',
  storage_path text not null,
  original_name text,
  mime_type text not null,
  size_bytes integer not null,
  sort_order integer not null default 0,
  created_at timestamptz not null default now()
);

create table if not exists public.reviews (
  id uuid primary key default gen_random_uuid(),
  display_name text not null,
  service text,
  region text,
  rating integer check (rating between 1 and 5),
  body text not null,
  status text not null default 'pending' check (status in ('pending', 'published', 'private', 'spam')),
  admin_reply text,
  privacy_agreed boolean not null default false,
  source text not null default 'admin' check (source in ('admin', 'customer', 'sample', 'migrated')),
  deleted_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.review_images (
  id uuid primary key default gen_random_uuid(),
  review_id uuid not null references public.reviews(id) on delete cascade,
  storage_bucket text not null default 'review-images',
  storage_path text not null,
  alt_text text,
  sort_order integer not null default 0,
  created_at timestamptz not null default now()
);

create table if not exists public.faqs (
  id uuid primary key default gen_random_uuid(),
  question text not null,
  answer text not null,
  category text not null default '기타',
  sort_order integer not null default 0,
  status text not null default 'published' check (status in ('draft', 'published', 'private', 'archived')),
  show_on_home boolean not null default false,
  source text not null default 'admin' check (source in ('admin', 'migrated', 'sample')),
  deleted_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists idx_cases_status_featured on public.cases(status, is_featured, published_at desc);
create index if not exists idx_cases_service on public.cases(service);
create index if not exists idx_cleaning_posts_status_featured on public.cleaning_posts(status, is_featured, published_at desc);
create index if not exists idx_inquiries_status_created on public.inquiries(status, created_at desc);
create index if not exists idx_reviews_status_created on public.reviews(status, created_at desc);
create index if not exists idx_faqs_status_sort on public.faqs(status, sort_order);

create trigger set_admin_profiles_updated_at before update on public.admin_profiles for each row execute function public.set_updated_at();
create trigger set_categories_updated_at before update on public.categories for each row execute function public.set_updated_at();
create trigger set_cases_updated_at before update on public.cases for each row execute function public.set_updated_at();
create trigger set_cleaning_posts_updated_at before update on public.cleaning_posts for each row execute function public.set_updated_at();
create trigger set_notices_updated_at before update on public.notices for each row execute function public.set_updated_at();
create trigger set_inquiries_updated_at before update on public.inquiries for each row execute function public.set_updated_at();
create trigger set_reviews_updated_at before update on public.reviews for each row execute function public.set_updated_at();
create trigger set_faqs_updated_at before update on public.faqs for each row execute function public.set_updated_at();

alter table public.admin_profiles enable row level security;
alter table public.categories enable row level security;
alter table public.cases enable row level security;
alter table public.case_images enable row level security;
alter table public.cleaning_posts enable row level security;
alter table public.cleaning_post_images enable row level security;
alter table public.notices enable row level security;
alter table public.inquiries enable row level security;
alter table public.inquiry_images enable row level security;
alter table public.reviews enable row level security;
alter table public.review_images enable row level security;
alter table public.faqs enable row level security;

revoke all on table public.admin_profiles, public.categories, public.cases, public.case_images, public.cleaning_posts, public.cleaning_post_images, public.notices, public.inquiries, public.inquiry_images, public.reviews, public.review_images, public.faqs from anon, authenticated;

grant select on table public.categories, public.cases, public.case_images, public.cleaning_posts, public.cleaning_post_images, public.notices, public.reviews, public.review_images, public.faqs to anon, authenticated;
grant insert on table public.inquiries to anon, authenticated;
grant select, insert, update, delete on table public.admin_profiles, public.categories, public.cases, public.case_images, public.cleaning_posts, public.cleaning_post_images, public.notices, public.inquiries, public.inquiry_images, public.reviews, public.review_images, public.faqs to authenticated;

create policy "Admins can manage admin profiles" on public.admin_profiles for all to authenticated using (app_private.is_admin()) with check (app_private.is_admin());
create policy "Admins can read own admin profile" on public.admin_profiles for select to authenticated using (user_id = (select auth.uid()));

create policy "Public can read active categories" on public.categories for select to anon, authenticated using (is_active = true);
create policy "Admins can manage categories" on public.categories for all to authenticated using (app_private.is_admin()) with check (app_private.is_admin());

create policy "Public can read published cases" on public.cases for select to anon, authenticated using (status = 'published' and deleted_at is null);
create policy "Admins can manage cases" on public.cases for all to authenticated using (app_private.is_admin()) with check (app_private.is_admin());
create policy "Public can read published case images" on public.case_images for select to anon, authenticated using (exists (select 1 from public.cases c where c.id = case_id and c.status = 'published' and c.deleted_at is null));
create policy "Admins can manage case images" on public.case_images for all to authenticated using (app_private.is_admin()) with check (app_private.is_admin());

create policy "Public can read published cleaning posts" on public.cleaning_posts for select to anon, authenticated using (status = 'published' and deleted_at is null);
create policy "Admins can manage cleaning posts" on public.cleaning_posts for all to authenticated using (app_private.is_admin()) with check (app_private.is_admin());
create policy "Public can read published cleaning post images" on public.cleaning_post_images for select to anon, authenticated using (exists (select 1 from public.cleaning_posts p where p.id = post_id and p.status = 'published' and p.deleted_at is null));
create policy "Admins can manage cleaning post images" on public.cleaning_post_images for all to authenticated using (app_private.is_admin()) with check (app_private.is_admin());

create policy "Public can read published notices" on public.notices for select to anon, authenticated using (status = 'published' and deleted_at is null);
create policy "Admins can manage notices" on public.notices for all to authenticated using (app_private.is_admin()) with check (app_private.is_admin());

create policy "Anyone can create inquiries" on public.inquiries for insert to anon, authenticated with check (privacy_agreed = true and deleted_at is null);
create policy "Admins can manage inquiries" on public.inquiries for all to authenticated using (app_private.is_admin()) with check (app_private.is_admin());
create policy "Admins can manage inquiry images" on public.inquiry_images for all to authenticated using (app_private.is_admin()) with check (app_private.is_admin());

create policy "Public can read approved reviews" on public.reviews for select to anon, authenticated using (status = 'published' and deleted_at is null);
create policy "Admins can manage reviews" on public.reviews for all to authenticated using (app_private.is_admin()) with check (app_private.is_admin());
create policy "Public can read approved review images" on public.review_images for select to anon, authenticated using (exists (select 1 from public.reviews r where r.id = review_id and r.status = 'published' and r.deleted_at is null));
create policy "Admins can manage review images" on public.review_images for all to authenticated using (app_private.is_admin()) with check (app_private.is_admin());

create policy "Public can read published FAQs" on public.faqs for select to anon, authenticated using (status = 'published' and deleted_at is null);
create policy "Admins can manage FAQs" on public.faqs for all to authenticated using (app_private.is_admin()) with check (app_private.is_admin());

insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values
  ('public-content-images', 'public-content-images', true, 10485760, array['image/jpeg', 'image/png', 'image/webp']),
  ('inquiry-attachments', 'inquiry-attachments', false, 10485760, array['image/jpeg', 'image/png', 'image/webp']),
  ('review-images', 'review-images', false, 10485760, array['image/jpeg', 'image/png', 'image/webp'])
on conflict (id) do update set
  public = excluded.public,
  file_size_limit = excluded.file_size_limit,
  allowed_mime_types = excluded.allowed_mime_types;

create policy "Public can read public content images" on storage.objects for select to anon, authenticated using (bucket_id = 'public-content-images');
create policy "Admins can manage public content images" on storage.objects for all to authenticated using (bucket_id = 'public-content-images' and app_private.is_admin()) with check (bucket_id = 'public-content-images' and app_private.is_admin());
create policy "Admins can read inquiry attachments" on storage.objects for select to authenticated using (bucket_id = 'inquiry-attachments' and app_private.is_admin());
create policy "Admins can manage inquiry attachments" on storage.objects for all to authenticated using (bucket_id = 'inquiry-attachments' and app_private.is_admin()) with check (bucket_id = 'inquiry-attachments' and app_private.is_admin());
create policy "Admins can manage review images" on storage.objects for all to authenticated using (bucket_id = 'review-images' and app_private.is_admin()) with check (bucket_id = 'review-images' and app_private.is_admin());

-- Default categories
insert into public.categories (type, slug, name, sort_order)
values
  ('case_service', 'regular', '정기청소', 10),
  ('case_service', 'office', '상가·사무실청소', 20),
  ('case_service', 'floor-wax', '바닥·왁스코팅', 30),
  ('case_service', 'building', '건물·계단청소', 40),
  ('case_service', 'parking', '주차장청소', 50),
  ('case_service', 'restroom', '화장실청소', 60),
  ('case_service', 'window', '유리창청소', 70),
  ('case_service', 'kitchen', '급식실·주방청소', 80),
  ('case_service', 'special', '특수청소', 90),
  ('case_service', 'aircon', '에어컨청소', 100),
  ('case_service', 'move-in', '입주·이사·준공청소', 110),
  ('case_service', 'fabric', '소파·매트리스·카펫케어', 120),
  ('case_service', 'etc', '기타', 130),
  ('cleaning_post', 'prep', '청소 준비·이용안내', 10),
  ('cleaning_post', 'office', '사무실·상가 관리', 20),
  ('cleaning_post', 'floor', '바닥·왁스 관리', 30),
  ('cleaning_post', 'restroom', '화장실 관리', 40),
  ('cleaning_post', 'window', '유리창 관리', 50),
  ('cleaning_post', 'kitchen', '주방·위생 관리', 60),
  ('cleaning_post', 'aircon', '에어컨 관리', 70),
  ('cleaning_post', 'move', '입주·이사 관리', 80),
  ('cleaning_post', 'tips', '생활 청소 팁', 90),
  ('faq', 'service', '서비스', 10),
  ('faq', 'estimate', '견적', 20),
  ('faq', 'prepare', '작업 준비', 30),
  ('faq', 'schedule', '일정', 40),
  ('faq', 'payment', '결제', 50),
  ('faq', 'aftercare', '사후관리', 60),
  ('faq', 'etc', '기타', 70)
on conflict (type, slug) do update set name = excluded.name, sort_order = excluded.sort_order, is_active = true;
