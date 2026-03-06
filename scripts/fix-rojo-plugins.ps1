# Rojo 플러그인 중복 제거 - 하나만 남기기
# 1) Roblox Studio를 완전히 종료한 뒤 실행하세요.
# 2) 프로젝트 루트에서: .\scripts\fix-rojo-plugins.ps1

$ProjectRoot = Split-Path -Parent $PSScriptRoot
$RojoExe = Join-Path $ProjectRoot "tools\rojo\rojo.exe"
$PluginsFolder = Join-Path $env:LOCALAPPDATA "Roblox\Plugins"

if (-not (Test-Path $PluginsFolder)) {
    Write-Host "Roblox 플러그인 폴더를 찾을 수 없습니다: $PluginsFolder" -ForegroundColor Yellow
    exit 1
}

# Rojo 관련 플러그인만 제거 (중복 제거)
$rojoPlugins = Get-ChildItem $PluginsFolder -Filter "*.rbxm" -ErrorAction SilentlyContinue | Where-Object { $_.Name -match "Rojo|RojoManaged" }
if ($rojoPlugins.Count -eq 0) {
    Write-Host "제거할 Rojo 플러그인 파일이 없습니다." -ForegroundColor Gray
} else {
    foreach ($f in $rojoPlugins) {
        Write-Host "제거: $($f.Name)" -ForegroundColor Yellow
        Remove-Item $f.FullName -Force
    }
    Write-Host "기존 Rojo 플러그인을 제거했습니다." -ForegroundColor Green
}

# Rojo CLI로 공식 플러그인 하나만 설치
if (-not (Test-Path $RojoExe)) {
    Write-Host "Rojo CLI가 없습니다. 먼저 .\scripts\install-rojo.ps1 를 실행하세요." -ForegroundColor Red
    exit 1
}

Write-Host "Rojo 공식 플러그인 설치 중..." -ForegroundColor Cyan
& $RojoExe plugin install
if ($LASTEXITCODE -ne 0) {
    Write-Host "플러그인 설치 실패. Roblox Studio를 종료한 뒤 다시 시도하세요." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "완료. Roblox Studio를 다시 실행하면 Rojo가 하나만 보입니다." -ForegroundColor Green
Write-Host "연결 시 주소: 127.0.0.1  포트: 34872" -ForegroundColor Cyan
