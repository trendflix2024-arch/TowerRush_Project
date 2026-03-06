# 타워러시 프로젝트 - 새 PC 셋팅 스크립트
# 사용법: 이 스크립트를 새 PC에서 원하는 폴더에 넣고 실행 (예: 바탕화면, 문서)
# 실행: PowerShell에서 .\setup-new-pc.ps1

$RepoUrl = "https://github.com/trendflix2024-arch/TowerRush_Project.git"
$ProjectName = "TowerRush_Project"

Write-Host "=== 타워러시 프로젝트 새 PC 셋팅 ===" -ForegroundColor Cyan

# 1. Git 설치 확인
try {
    $gitVersion = git --version 2>&1
    Write-Host "[OK] Git 설치됨: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "[실패] Git이 설치되어 있지 않습니다. https://git-scm.com/download/win 에서 설치 후 다시 실행하세요." -ForegroundColor Red
    exit 1
}

# 2. 클론: 현재(또는 상위) 폴더가 이미 저장소면 스킵, 아니면 클론
$isAlreadyRepo = (Test-Path ".git") -or (Test-Path "..\.git")
$hasProjectFolder = Test-Path $ProjectName

if ($isAlreadyRepo) {
    Write-Host "[알림] 이미 프로젝트 저장소 안입니다. 클론을 건너뜁니다." -ForegroundColor Yellow
    if (-not (Test-Path ".git")) { Set-Location ".." }
} elseif ($hasProjectFolder) {
    Write-Host "[알림] $ProjectName 폴더가 이미 있습니다. 해당 폴더로 이동합니다." -ForegroundColor Yellow
    Set-Location $ProjectName
} else {
    Write-Host "저장소 클론 중..." -ForegroundColor Cyan
    git clone $RepoUrl
    if ($LASTEXITCODE -ne 0) {
        Write-Host "[실패] 클론에 실패했습니다. 네트워크와 URL을 확인하세요." -ForegroundColor Red
        exit 1
    }
    Set-Location $ProjectName
    Write-Host "[OK] 클론 완료: $(Get-Location)" -ForegroundColor Green
}

# 3. Git 사용자 설정 확인
$userName = git config --global user.name 2>$null
$userEmail = git config --global user.email 2>$null

if (-not $userName -or -not $userEmail) {
    Write-Host ""
    Write-Host "Git 사용자 정보가 없습니다. 아래 명령으로 한 번 설정해 주세요:" -ForegroundColor Yellow
    Write-Host '  git config --global user.name "본인이름"'
    Write-Host '  git config --global user.email "본인이메일@example.com"'
    Write-Host ""
} else {
    Write-Host "[OK] Git 사용자: $userName <$userEmail>" -ForegroundColor Green
}

Write-Host ""
Write-Host "셋팅이 완료되었습니다. 프로젝트 폴더: $(Get-Location)" -ForegroundColor Cyan
Write-Host "Cursor에서 '파일 > 폴더 열기'로 이 폴더를 열어 개발을 이어가면 됩니다." -ForegroundColor Cyan
Write-Host "자세한 내용은 docs/SETUP.md 를 참고하세요." -ForegroundColor Gray
