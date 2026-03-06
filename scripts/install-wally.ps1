# Wally CLI 설치 (프로젝트 tools/wally/ 에 설치)
# 프로젝트 루트에서 실행: .\scripts\install-wally.ps1

$ProjectRoot = Split-Path -Parent $PSScriptRoot
$ToolsDir = Join-Path $ProjectRoot "tools"
$WallyDir = Join-Path $ToolsDir "wally"
$WallyExe = Join-Path $WallyDir "wally.exe"

if (Test-Path $WallyExe) {
    Write-Host "Wally가 이미 설치되어 있습니다: $WallyDir" -ForegroundColor Green
    & $WallyExe --version
    exit 0
}

$Version = "0.3.2"
$ZipName = "wally-v$Version-win64.zip"
$Url = "https://github.com/UpliftGames/wally/releases/download/v$Version/$ZipName"
$ZipPath = Join-Path $ToolsDir "wally.zip"

Write-Host "Wally $Version 다운로드 중..." -ForegroundColor Cyan
New-Item -ItemType Directory -Path $ToolsDir -Force | Out-Null

try {
    Invoke-WebRequest -Uri $Url -OutFile $ZipPath -UseBasicParsing
} catch {
    Write-Host "다운로드 실패: $_" -ForegroundColor Red
    exit 1
}

Expand-Archive -Path $ZipPath -DestinationPath $WallyDir -Force
Remove-Item $ZipPath -Force -ErrorAction SilentlyContinue

if (Test-Path $WallyExe) {
    Write-Host "설치 완료. Wally: $WallyDir" -ForegroundColor Green
    Write-Host "패키지 설치: .\scripts\install-wally-packages.ps1" -ForegroundColor Cyan
} else {
    Write-Host "압축 해제 후 wally.exe를 찾을 수 없습니다." -ForegroundColor Red
    exit 1
}
