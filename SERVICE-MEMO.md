# 【가공 견적산출 Pro — 서비스 관리 메모】

> 최종 갱신: 2026-06-24  
> 랜딩(softlab.ai.kr) + 견적 앱(quote.softlab.ai.kr) 통합 운영 요약

---

## ■ 한 줄 요약

크몽 주문 → 휴대폰 발급 페이지(이메일만) → Supabase 키 저장 → Resend 메일  
코드·배포 = GitHub + Vercel  
도메인 = 가비아(softlab.ai.kr) → Vercel 연결 (**DNS만**, 웹호스팅/FTP 사용 안 함)

---

## ■ URL 한눈에

| 역할 | URL |
|------|-----|
| **마케팅(랜딩)** | https://softlab.ai.kr |
| **구매자·앱** | https://quote.softlab.ai.kr |
| **키 발급** ★ 북마크 | https://quote.softlab.ai.kr/admin/issue.html |
| **크몽 구매** | https://kmong.com/gig/778137 |
| 코드(앱) | https://github.com/player99099/machining-quote (Private) |
| 코드(랜딩) | https://github.com/player99099/softlab-landing (Public) |
| 배포(앱) | https://vercel.com → `machining-quote` |
| 배포(랜딩) | https://vercel.com → `softlab-landing` |
| 도메인 | https://www.gabia.com → softlab.ai.kr |
| DB | https://supabase.com |
| 메일 | https://resend.com |

---

## 0. 가비아 (도메인 — softlab.ai.kr)

**역할:** 도메인 + DNS만 (웹호스팅/FTP 사용 안 함)

**접속:** https://www.gabia.com → My가비아 → softlab.ai.kr → DNS 관리

### DNS (운영 중 — `quote` 건드리지 않기)

| 호스트 | 타입 | 값 | 용도 |
|--------|------|-----|------|
| `quote` | CNAME | `cname.vercel-dns.com` (또는 vercel-dns-xxxxx) | 견적 앱 |
| `@` | A | `76.76.21.21` | 마케팅 랜딩 |
| `www` | A | `76.76.21.21` | 마케팅 랜딩 |

### Resend 메일 도메인 (아직이면 추가)

1. Resend → Domains → `softlab.ai.kr`
2. 가비아 DNS에 Resend TXT/CNAME 추가
3. Verified → 구매자 메일 정상 발송

상세: `machining-quote/web/server/RESEND-DOMAIN-SETUP.md`  
랜딩 DNS: [GABIA-DNS.md](./GABIA-DNS.md)

### 내가 하는 일

- 도메인 갱신(만료) 알림 확인
- `quote` 레코드는 수정하지 않기
- 문제 시: My가비아 → DNS 관리

### 백업 URL (자동 리다이렉트)

https://machining-quote-six.vercel.app → `quote.softlab.ai.kr`

---

## 1. GITHUB (코드 저장)

### machining-quote (Private) — 견적 앱 + API

https://github.com/player99099/machining-quote

### softlab-landing (Public) — 마케팅 랜딩만

https://github.com/player99099/softlab-landing

- `index.html` 수정 → push → Vercel 자동 배포
- 환경변수 없음

### 내가 하는 일

- Cursor에서 수정 후 push
- service_role, API키, ADMIN_API_SECRET → **GitHub에 올리지 않기**

---

## 2. VERCEL (웹·API 호스팅)

### machining-quote (견적 앱 + 라이선스 API)

- 접속: https://vercel.com → `machining-quote`
- Root: `web/client`
- 도메인: `quote.softlab.ai.kr` (Valid)

### softlab-landing (마케팅)

- 접속: https://vercel.com → `softlab-landing`
- Root: `.` (`index.html`)
- 도메인: `softlab.ai.kr`, `www.softlab.ai.kr`

### 구매자 URL (고정 — 크몽·메일·CS)

https://quote.softlab.ai.kr

### 판매자 — 키 발급 (비밀번호 없음)

https://quote.softlab.ai.kr/admin/issue.html → 휴대폰 북마크/홈화면 ★

### 환경변수 (machining-quote만)

| Name | 비고 |
|------|------|
| `SUPABASE_URL` | |
| `SUPABASE_SERVICE_ROLE_KEY` | |
| `LICENSE_HMAC_SECRET` | |
| `RESEND_API_KEY` | |
| `RESEND_FROM` | `가공 견적산출 Pro <noreply@softlab.ai.kr>` (인증 전: onboarding@resend.dev) |
| `WEB_SERVICE_URL` | `https://quote.softlab.ai.kr` |
| `ALLOWED_ORIGINS` | vercel주소 + quote.softlab.ai.kr (쉼표 구분) |
| `ADMIN_API_SECRET` | admin-devices/migrate용 (**발급 API는 미사용**) |

### 배포 확인

```bash
node web/server/scripts/test-deploy.js https://quote.softlab.ai.kr
```

---

## 3. SUPABASE (인증키 DB)

**접속:** https://supabase.com → Table Editor

### licenses — 발급 이력의 원본

| 컬럼 | 의미 |
|------|------|
| `license_key` | 인증키 (정규화 저장) |
| `status` | pending / active / revoked / expired |
| `kmong_order_id` | 주문번호 (**선택**, null 가능) |
| `notes` | `email:구매자@...` 형식 |

### license_activations — 기기 등록

### 내가 하는 일

- 발급 이력: 발급 페이지 하단 「발급 이력」표 (전체 키, 최근 200건)
- (필요 시) `status` → `revoked` 로 회수
- service_role 키는 절대 공유·Git 금지

---

## 4. RESEND (메일 발송)

**역할:** 구매자에게 URL + 라이선스 키 메일

**접속:** https://resend.com → Emails (발송 기록)

### 발신 주소

| 단계 | RESEND_FROM |
|------|-------------|
| 인증 전(테스트) | `onboarding@resend.dev` — **본인 Gmail로만** 테스트 가능 |
| 인증 후(운영) | `noreply@softlab.ai.kr` |

Vercel `RESEND_FROM` 과 동일하게 맞출 것.

### 도메인 인증 절차

1. resend.com/domains → softlab.ai.kr 추가
2. 가비아 DNS에 Resend TXT/CNAME 추가
3. Verified 확인 → Vercel Redeploy

상세: `machining-quote/web/server/RESEND-DOMAIN-SETUP.md`

### 메일 실패해도

- 키는 DB에 저장됨
- 발급 페이지에 키 표시 → 크몽 문의로 수동 전달 가능

---

## ■ 크몽 주문 시 (매번)

1. 크몽에서 결제·이메일 확인 (**주문번호는 선택**)
2. https://quote.softlab.ai.kr/admin/issue.html
3. **구매자 이메일** 입력 (주문번호·구매자명은 선택)
4. 「발급 + 메일 보내기」
5. ✅ 처리 완료 또는 ⚠️ 키 발급·메일 실패 → 하단 이력·키 복사
6. 크몽에 「메일 확인」 또는 키 직접 전달

> **2026-06-24 변경:** 관리자 비밀번호 입력 없음  
> 발급 이력: 같은 페이지 하단 「발급 이력」표 (전체 키)

**구매자 접속 URL (고정):** https://quote.softlab.ai.kr

---

## ■ 비밀값 — Keep·Git·채팅에 올리지 말 것

- SUPABASE service_role
- RESEND API Key (`re_...`)
- LICENSE_HMAC_SECRET
- ADMIN_API_SECRET (기기관리 API용, 발급 페이지와 무관)

→ Vercel Environment Variables + 로컬 `.env.local` 만

---

## ■ 보안 참고

- 발급 페이지 URL을 아는 사람은 **누구나 키 발급·이력 조회** 가능
- URL은 크몽·본인만 공유 (외부 유출 금지)
- (선택) Vercel Deployment Protection 으로 추가 보호 가능
