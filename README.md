# 가공 견적산출 Pro — 마케팅 랜딩

`softlab.ai.kr` 홍보용 정적 페이지. 견적 앱(`quote.softlab.ai.kr`)과 **완전 분리**된 저장소입니다.

## URL 역할

| 주소 | 용도 |
|------|------|
| https://softlab.ai.kr | 이 랜딩 (마케팅) |
| https://quote.softlab.ai.kr | 견적 웹앱 (machining-quote) |
| https://kmong.com/gig/778137 | 크몽 구매 |

## 로컬 미리보기

```bash
npm run preview
# 또는 index.html을 브라우저에서 직접 열기
```

## 배포 (최초 1회)

상세: [DEPLOY.md](./DEPLOY.md) · 가비아 DNS: [GABIA-DNS.md](./GABIA-DNS.md)

1. GitHub 저장소 `softlab-landing` 생성 후 push
2. Vercel → New Project → Import → Deploy
3. Vercel Domains: `softlab.ai.kr`, `www.softlab.ai.kr`
4. 가비아 DNS 2줄 추가 (GABIA-DNS.md 참고)

## 수정 후 재배포

`index.html` 수정 → `git push` → Vercel 자동 배포

환경변수 없음. Supabase·Resend·ADMIN과 무관합니다.
