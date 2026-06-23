# 가공 견적산출 Pro — 서비스 관리 메모 (전체)

> 랜딩(softlab.ai.kr) + 견적 앱(quote.softlab.ai.kr) 통합 운영 요약

---

## URL 한눈에

| 역할 | URL |
|------|-----|
| **마케팅 랜딩** | https://softlab.ai.kr |
| **구매자·견적 앱** | https://quote.softlab.ai.kr |
| **키 발급 (판매자)** | https://quote.softlab.ai.kr/admin/issue.html |
| 크몽 구매 | https://kmong.com/gig/778137 |
| 랜딩 코드 | GitHub `softlab-landing` |
| 앱 코드 | GitHub `machining-quote` (Private) |

---

## 0. 가비아 (도메인 — softlab.ai.kr)

역할: 도메인 + DNS만 (웹호스팅/FTP **사용 안 함**)

- `quote` → CNAME → Vercel (**machining-quote** 앱) — 기존 유지
- `@` → A → `76.76.21.21` → Vercel (**softlab-landing** 랜딩)
- `www` → A → `76.76.21.21` → 랜딩

상세: [GABIA-DNS.md](./GABIA-DNS.md)

---

## 1. softlab-landing (마케팅)

역할: 홍보·SEO·크몽 유입. 환경변수 없음.

- Vercel 프로젝트: `softlab-landing`
- 파일: `index.html` (수정 후 push → 자동 배포)
- 크몽·무료체험 링크는 HTML에서만 변경

---

## 2. machining-quote (견적 앱 + API)

역할: 견적 웹앱, 라이선스 API, 키 발급

- Vercel 프로젝트: `machining-quote`
- Root: `web/client`
- 도메인: `quote.softlab.ai.kr`
- 환경변수: SUPABASE_*, RESEND_*, ADMIN_API_SECRET, LICENSE_HMAC_SECRET, WEB_SERVICE_URL, ALLOWED_ORIGINS

배포 확인:
```bash
node web/server/scripts/test-deploy.js https://quote.softlab.ai.kr
```

---

## 3. 크몽 주문 시 (매번)

1. 크몽 결제·이메일·주문번호 확인
2. https://quote.softlab.ai.kr/admin/issue.html
3. ADMIN 비밀번호 + 이메일 + 주문번호 → 발급+메일
4. 크몽에 「메일 확인」 안내

구매자 URL (고정): **https://quote.softlab.ai.kr**

---

## 4. 비밀값 — Git·Keep 금지

- SUPABASE service_role
- RESEND API Key
- ADMIN_API_SECRET
- LICENSE_HMAC_SECRET

→ machining-quote의 `.env.local` + Vercel에만

---

## 5. Resend (나중)

발신: `onboarding@resend.dev` → 인증 후 `noreply@softlab.ai.kr`  
가비아 DNS에 Resend SPF/DKIM 추가
