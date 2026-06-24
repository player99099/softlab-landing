# 🚀 지금 해야 할 일

GitHub push · Vercel Git 연동 · 프로덕션 배포 **완료** (2026-06-24)

**라이브:** https://softlab.ai.kr  
**미리보기:** https://softlab-landing-sooty.vercel.app  
**코드:** https://github.com/player99099/softlab-landing

---

## 가비아 DNS (아직 안 열리면)

`softlab.ai.kr`이 안 열릴 때만 확인하세요. `quote` 레코드는 건드리지 마세요.

| 호스트 | 타입 | 값 |
|--------|------|-----|
| `@` | A | `76.76.21.21` |
| `www` | A | `76.76.21.21` |

---

## 완료 후 URL

| 용도 | 주소 |
|------|------|
| 마케팅 (랜딩) | https://softlab.ai.kr |
| 견적 프로그램 | https://quote.softlab.ai.kr |
| 키 발급 (본인만) | https://quote.softlab.ai.kr/admin/issue.html |

---

## (선택) GitHub 백업

GitHub에 코드를 올리려면:

1. https://github.com/new → 저장소 이름 `softlab-landing` → Create
2. PowerShell:

```powershell
cd softlab-landing
git remote add origin https://github.com/player99099/softlab-landing.git
git push -u origin main
```

이후 `index.html` 수정 → push 하면 Vercel이 Git 연동 시 자동 재배포됩니다.  
(Git 연동은 Vercel 대시보드 → softlab-landing → Settings → Git)

---

## Vercel 대시보드

https://vercel.com/player99099s-projects/softlab-landing
