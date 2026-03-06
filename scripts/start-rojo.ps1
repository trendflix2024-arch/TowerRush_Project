# 타워러시 - Rojo 서버 실행 (로블록스 스튜디오 연동용)
# 프로젝트 루트에서 실행: .\scripts\start-rojo.ps1

$ProjectRoot = Split-Path -Parent $PSScriptRoot
$RojoExe = Join-Path $ProjectRoot "tools\rojo\rojo.exe"

if (-not (Test-Path $RojoExe)) {
    Write-Host "Rojo가 설치되어 있지 않습니다. 먼저 아래를 실행하세요:" -ForegroundColor Yellow
    Write-Host "  .\scripts\install-rojo.ps1" -ForegroundColor Cyan
    exit 1
}

Write-Host "Rojo 서버 시작 중..." -ForegroundColor Cyan
Write-Host "  연결 주소: 127.0.0.1  포트: 34872" -ForegroundColor Gray
Write-Host "  (Roblox Studio -> Rojo 플러그인 -> Connect)" -ForegroundColor Gray
Set-Location $ProjectRoot
& $RojoExe serve
