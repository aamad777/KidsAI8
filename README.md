# Dad AI — Cloudflare Pages + Workers

## What’s inside
- `index.html` — kids app (Ask, Story, Book Q&A, Drawing, Cat family). Offline AI + optional Gemini.
- `worker.mjs` — API for logging, email to Dad (MailChannels), simple admin endpoints.
- `wrangler.toml` — Worker config + D1 binding.
- `schema.sql` — D1 table.
- `admin.html` — tiny dashboard.

## Deploy

### 1) Pages (static)
- Put these files in a GitHub repo.
- Cloudflare Dashboard → Pages → Create project → Connect to Git.
- Framework preset: **None**, Build command: *(blank)*, Output dir: `.`

### 2) Worker + D1
```bash
wrangler d1 create dad_ai_db
# copy database_id into wrangler.toml
wrangler d1 execute dad_ai_db --file=./schema.sql
wrangler secret put DAD_EMAIL
wrangler secret put ADMIN_PASS
wrangler deploy
```

### 3) Routes
Workers → Add Route → `dad-ai.online/api/*` → Select `dad-ai-worker`

### 4) Admin
Open `https://dad-ai.online/admin.html` → enter password for Basic Auth (user `dad`).
