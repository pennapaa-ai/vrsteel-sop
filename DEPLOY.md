# วิธี Deploy VRSteel SOP Knowledge System

## ขั้นตอนที่ 1 — ตั้งค่า Supabase

1. เข้า Supabase project ที่ต้องการใช้
2. ไปที่ **SQL Editor** → New query
3. วางโค้ดจากไฟล์ `supabase-schema.sql` แล้วกด **Run**
4. ไปที่ **Settings → API** → คัดลอก:
   - **Project URL** (เช่น `https://abcxyz.supabase.co`)
   - **anon public** key

5. แก้ไขทั้ง 2 ไฟล์ HTML โดยหาบรรทัดนี้ (มีในทั้ง SOP-Builder.html และ SOP-Library.html):
```
var SUPABASE_URL = 'https://YOUR_PROJECT_REF.supabase.co';
var SUPABASE_KEY = 'YOUR_ANON_KEY';
```
แล้วแทนที่ด้วย URL และ Key ที่คัดลอกมา

---

## ขั้นตอนที่ 2 — ตั้งค่า GitHub Repository

เปิด Terminal แล้วรันคำสั่งเหล่านี้:

```bash
# เข้าไปในโฟลเดอร์โปรเจกต์
cd "/Users/pennapaaneknuan/Documents/Claude/Projects/SOP Knowledge V.2"

# เริ่ม git
git init
git add .
git commit -m "Initial commit: VRSteel SOP Knowledge System"

# สร้าง repo บน GitHub ก่อน (github.com → New repository → ชื่อ: vrsteel-sop)
# แล้วรันต่อ:
git remote add origin https://github.com/YOUR_GITHUB_USERNAME/vrsteel-sop.git
git branch -M main
git push -u origin main
```

---

## ขั้นตอนที่ 3 — เชื่อมต่อ Netlify กับ GitHub

1. เข้า [netlify.app](https://netlify.app) → **Add new project**
2. เลือก **Import an existing project** → **Deploy with GitHub**
3. เลือก repository `vrsteel-sop`
4. ตั้งค่า:
   - **Branch to deploy**: `main`
   - **Publish directory**: `.` (จุดเดียว)
5. กด **Deploy**

---

## ขั้นตอนที่ 4 — อัปเดตในอนาคต

เมื่อแก้ไขไฟล์แล้ว รันแค่นี้:

```bash
cd "/Users/pennapaaneknuan/Documents/Claude/Projects/SOP Knowledge V.2"
git add .
git commit -m "อธิบายสิ่งที่เปลี่ยน"
git push
```

Netlify จะ deploy อัตโนมัติภายใน ~30 วินาที

---

## URL หลังจาก Deploy

- SOP Library: `https://your-site.netlify.app/SOP-Library.html`
- SOP Builder: `https://your-site.netlify.app/SOP-Builder.html`

สามารถตั้ง custom domain ได้ใน Netlify → Domain settings
