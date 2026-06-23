# GitHub에 softlab-landing 최초 push
# 사전: https://github.com/new 에서 softlab-landing 저장소 생성

$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $Root

if (-not (Test-Path .git)) {
  git init
  git branch -M main
}

git add .
$status = git status --porcelain
if (-not $status) {
  Write-Host "커밋할 변경 없음."
  exit 0
}

git commit -m "feat: 가공 견적산출 Pro 마케팅 랜딩"

$remote = git remote get-url origin 2>$null
if (-not $remote) {
  git remote add origin https://github.com/player99099/softlab-landing.git
}

Write-Host ""
Write-Host "다음: git push -u origin main"
Write-Host "GitHub 로그인 필요 시 브라우저 또는 Personal Access Token 사용"
