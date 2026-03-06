# Wally 패키지 설치 (wally install)
# 프로젝트 루트에서 실행: .\scripts\install-wally-packages.ps1

$ProjectRoot = Split-Path -Parent $PSScriptRoot
$WallyExe = Join-Path $ProjectRoot "tools\wally\wally.exe"

if (-not (Test-Path $WallyExe)) {
    Write-Host "Wally가 설치되어 있지 않습니다. 먼저 .\scripts\install-wally.ps1 를 실행하세요." -ForegroundColor Red
    exit 1
}

Set-Location $ProjectRoot
Write-Host "Wally 패키지 설치 중... (wally.toml 기준)" -ForegroundColor Cyan
& $WallyExe install
if ($LASTEXITCODE -eq 0) {
    Write-Host "완료. Packages 폴더가 ReplicatedStorage.Packages 로 Rojo와 동기화됩니다." -ForegroundColor Green
} else {
    Write-Host "설치 실패. wally.toml 형식과 네트워크를 확인하세요." -ForegroundColor Red
    exit 1
}
