# 타워러시 프로젝트

TowerRush_Project

## 새 PC에서 환경 셋팅

다른 데스크톱에서 이어서 작업할 때는 **[환경 셋팅 가이드](docs/SETUP.md)**를 참고하세요.

## 로블록스 스튜디오 연동 (Rojo)

- **Rojo**로 에디터 코드를 스튜디오에 실시간 동기화 후 플레이 테스트할 수 있습니다.
- 스크립트: `src/ServerScriptService/`, `src/StarterPlayerScripts/`, `src/ReplicatedStorage/`
- 자세한 절차는 [SETUP.md - 5. 로블록스 스튜디오 연동 및 플레이 테스트](docs/SETUP.md#5-로블록스-스튜디오-연동-및-플레이-테스트-rojo) 참고.

## Wally (패키지 매니저)

- **Wally**로 Lua 패키지를 설치하면 `Packages/`에 내려받아지고, Rojo가 `ReplicatedStorage.Packages`로 동기화합니다.
- CLI 설치: `.\scripts\install-wally.ps1` → 패키지 설치: `.\scripts\install-wally-packages.ps1` ([SETUP.md - 6. Wally](docs/SETUP.md#6-wally-패키지-매니저-선택)).
