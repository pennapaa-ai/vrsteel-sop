-- VRSteel SOP Knowledge System
-- รันใน Supabase SQL Editor
-- ใช้ pattern เดียวกับ Sales Executive Quiz (app_data key-value table)

create table if not exists app_data (
  key text primary key,
  value jsonb,
  updated_at timestamptz default now()
);

alter table app_data enable row level security;

create policy "allow all" on app_data for all using (true) with check (true);
