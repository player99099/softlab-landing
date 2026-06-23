# 가비아 DNS — softlab.ai.kr (마케팅 랜딩)

가비아는 **도메인 + DNS만** 사용합니다. 웹호스팅/FTP는 **사용하지 않습니다.**

접속: https://www.gabia.com → **My가비아** → **softlab.ai.kr** → **DNS 관리**

---

## 이미 있는 레코드 (건드리지 않음)

| 호스트 | 타입 | 값 | 용도 |
|--------|------|-----|------|
| `quote` | CNAME | `cname.vercel-dns.com` (또는 vercel-dns-xxxxx) | 견적 앱 → machining-quote |

---

## 새로 추가할 레코드 (마케팅 랜딩)

Vercel **softlab-landing** 프로젝트에 도메인 등록 완료.  
아래 값을 **그대로** 가비아에 추가하세요 (Vercel CLI 안내와 동일).

| 호스트 | 타입 | 값 | TTL |
|--------|------|-----|-----|
| `@` (또는 비움) | **A** | `76.76.21.21` | 600 |
| `www` | **A** | `76.76.21.21` | 600 |

> 일부 가이드는 www에 CNAME을 쓰기도 하지만, 현재 Vercel이 **A 레코드**를 권장합니다.

### 의미

- `softlab.ai.kr` → Vercel 랜딩 (이 저장소)
- `www.softlab.ai.kr` → 같은 랜딩 (자동으로 non-www로 이동)
- `quote.softlab.ai.kr` → 기존 견적 앱 (변경 없음)

---

## 설정 후 확인

1. Vercel → softlab-landing → Domains → **Valid**
2. 브라우저에서 https://softlab.ai.kr 접속
3. 24시간이 지나도 안 되면 가비아 DNS 전파 상태 확인

---

## 문제 해결

| 증상 | 확인 |
|------|------|
| Vercel에 Invalid Configuration | A/CNAME 값이 Vercel 안내와 일치하는지 |
| softlab만 안 열림 | `@` A 레코드 존재 여부 |
| quote가 안 열림 | `quote` CNAME을 삭제·수정하지 않았는지 |
| www만 안 됨 | `www` CNAME 추가 |

---

## Resend 메일 도메인 (나중에, 선택)

발신 주소를 `noreply@softlab.ai.kr`로 바꿀 때 Resend가 안내하는 **SPF/DKIM** TXT 레코드를  
같은 가비아 DNS 화면에 추가합니다. 랜딩 배포와는 별도 작업입니다.
