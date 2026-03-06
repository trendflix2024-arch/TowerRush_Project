# Rojo CLI 설치 (프로젝트 tools/rojo/ 에 설치)
# 프로젝트 루트에서 실행: .\scripts\install-rojo.ps1

$ProjectRoot = Split-Path -Parent $PSScriptRoot
$ToolsDir = Join-Path $ProjectRoot "tools"
$RojoDir = Join-Path $ToolsDir "rojo"
$RojoExe = Join-Path $RojoDir "rojo.exe"

if (Test-Path $RojoExe) {
    Write-Host "Rojo가 이미 설치되어 있습니다: $RojoDir" -ForegroundColor Green
    & $RojoExe --version
    exit 0
}

$Version = "7.6.1"
$ZipName = "rojo-$Version-windows-x86_64.zip"
$Url = "https://github.com/rojo-rbx/rojo/releases/download/v$Version/$ZipName"
$ZipPath = Join-Path $ToolsDir "rojo.zip"

Write-Host "Rojo $Version 다운로드 중..." -ForegroundColor Cyan
New-Item -ItemType Directory -Path $ToolsDir -Force | Out-Null

try {
    Invoke-WebRequest -Uri $Url -OutFile $ZipPath -UseBasicParsing
} catch {
    Write-Host "다운로드 실패: $_" -ForegroundColor Red
    exit 1
}

Write-Host "압축 해제 중..." -ForegroundColor Cyan
Expand-Archive -Path $ZipPath -DestinationPath $RojoDir -Force
Remove-Item $ZipPath -Force -ErrorAction SilentlyContinue

# 플러그인 설치 (Roblox Studio용)
if (Test-Path $RojoExe) {
    Write-Host "Roblox Studio 플러그인 설치 중..." -ForegroundColor Cyan
    & $RojoExe plugin install
    Write-Host "설치 완료. Rojo: $RojoDir" -ForegroundColor Green
    Write-Host "서버 실행: .\scripts\start-rojo.ps1" -ForegroundColor Cyan
} else {
    Write-Host "압축 해제 후 rojo.exe를 찾을 수 없습니다." -ForegroundColor Red
    exit 1
}
