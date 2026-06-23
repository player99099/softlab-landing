# 배포 가이드 — softlab-landing

가공 견적산출 Pro **마케팅 랜딩**을 Vercel에 올리고 `softlab.ai.kr`에 연결하는 절차입니다.  
견적 앱(`machining-quote`)과는 **별도 Vercel 프로젝트**입니다.

---

## 1. GitHub 저장소 만들기

1. https://github.com/new 접속
2. Repository name: `softlab-landing`
3. Public (랜딩은 공개해도 됨) → Create repository
4. PC에서 이 폴더에서:

```powershell
cd softlab-landing
git init
git add .
git commit -m "feat: 가공 견적산출 Pro 마케팅 랜딩 초기 배포"
git branch -M main
git remote add origin https://github.com/player99099/softlab-landing.git
git push -u origin main
```

> `player99099`가 본인 계정이 맞는지 확인하세요.

---

## 2. Vercel 프로젝트 연결

1. https://vercel.com 로그인 (machining-quote와 같은 계정)
2. **Add New… → Project**
3. **Import** `softlab-landing` 저장소
4. 설정 확인:
   - Framework Preset: **Other**
   - Root Directory: **.** (기본값)
   - Build Command: 비움
   - Output Directory: 비움
5. **Environment Variables**: 추가 없음
6. **Deploy**

배포 후 임시 URL 예: `https://softlab-landing-xxxx.vercel.app`

---

## 3. Vercel 커스텀 도메인

프로젝트 → **Settings → Domains**

| 도메인 | 비고 |
|--------|------|
| `softlab.ai.kr` | 메인 마케팅 |
| `www.softlab.ai.kr` | www → 루트로 자동 리다이렉트 (`vercel.json`) |

각 도메인 옆 **Valid** 가 나올 때까지 대기 (DNS 반영 후 수 분~24시간).

> `quote.softlab.ai.kr`은 **machining-quote** 프로젝트에만 두세요. 이 프로젝트에 넣지 마세요.

---

## 4. 가비아 DNS (GABIA-DNS.md)

`quote` 레코드는 **건드리지 않습니다.**

---

## 5. 동작 확인

- [ ] `https://softlab.ai.kr` 랜딩 표시
- [ ] `https://www.softlab.ai.kr` → `softlab.ai.kr` 로 이동
- [ ] **크몽에서 구매** → kmong 링크
- [ ] **무료 체험** → `https://quote.softlab.ai.kr`
- [ ] `https://quote.softlab.ai.kr` 견적 앱 정상 (기존과 동일)

---

## 6. 이후 수정

1. `index.html` 편집
2. `git add . && git commit -m "..." && git push`
3. Vercel 자동 재배포

---

## 한눈에 URL

| 역할 | URL |
|------|-----|
| 마케팅 | https://softlab.ai.kr |
| 견적 앱 | https://quote.softlab.ai.kr |
| 키 발급 | https://quote.softlab.ai.kr/admin/issue.html |
| 코드(랜딩) | https://github.com/player99099/softlab-landing |
| 코드(앱) | https://github.com/player99099/machining-quote |
