# 타워러시 프로젝트 - 새 PC 환경 셋팅 가이드

새 데스크톱에서 이 저장소를 클론하고 개발을 이어가기 위한 단계별 가이드입니다.

---

## 1. Git 설치

1. [Git 다운로드](https://git-scm.com/download/win) 페이지에서 Windows용 설치 파일 다운로드
2. 설치 시 기본 옵션으로 진행 (Next 계속)
3. 설치 후 **새 터미널/PowerShell**을 열고 확인:

```powershell
git --version
```

---

## 2. 저장소 클론

### 방법 A: 스크립트로 한 번에 (권장)

- **아직 클론 안 한 새 PC**:  
  1. [GitHub에서 스크립트 다운로드](https://github.com/trendflix2024-arch/TowerRush_Project/raw/main/scripts/setup-new-pc.ps1) (우클릭 → 다른 이름으로 저장 → 예: 바탕화면에 `setup-new-pc.ps1` 저장)  
  2. 바탕화면(또는 원하는 폴더)에서 PowerShell 열고:  
     `.\setup-new-pc.ps1`  
  → 해당 폴더에 `TowerRush_Project`가 클론됩니다.

- **이미 클론한 뒤**: 프로젝트 폴더(`TowerRush_Project`)에서  
  `.\scripts\setup-new-pc.ps1`  
  → Git 설치 확인 및 사용자 설정 안내만 진행합니다.

스크립트는 Git 설치 확인, 클론(필요 시), Git 사용자 설정 안내까지 진행합니다.

### 방법 B: 수동 클론

```powershell
# 원하는 위치로 이동 (예: 바탕화면, 문서 폴더 등)
cd $env:USERPROFILE\Desktop

# 저장소 클론
git clone https://github.com/trendflix2024-arch/TowerRush_Project.git

# 프로젝트 폴더로 이동
cd TowerRush_Project
```

---

## 3. Git 사용자 설정 (최초 1회)

커밋할 때 사용할 이름과 이메일을 설정합니다. **GitHub 계정 이메일**을 사용하는 것을 권장합니다.

```powershell
git config --global user.name "본인GitHub이름"
git config --global user.email "본인이메일@example.com"
```

예시:
```powershell
git config --global user.name "trendflix2024-arch"
git config --global user.email "your-email@gmail.com"
```

---

## 4. 에디터 열기 (Cursor / VS Code)

- **Cursor**: `파일 > 폴더 열기` → `TowerRush_Project` 선택
- 또는 터미널에서:
  ```powershell
  cd TowerRush_Project
  cursor .
  ```
  (Cursor가 PATH에 등록되어 있어야 함)

---

## 5. 로블록스 스튜디오 연동 및 플레이 테스트 (Rojo)

에디터에서 수정한 코드를 로블록스 스튜디오에 실시간으로 반영하고 플레이 테스트하려면 **Rojo**를 사용합니다.

### 5-1. Rojo 설치

**방법 A: 프로젝트 스크립트로 설치 (권장)**

1. 프로젝트 루트에서 PowerShell 실행 후:
   ```powershell
   .\scripts\install-rojo.ps1
   ```
2. Rojo가 `tools/rojo/`에 설치되고, Roblox Studio 플러그인도 자동 설치됩니다.
3. 서버 실행은 `.\scripts\start-rojo.ps1` 로 합니다.

**방법 B: VS Code/Cursor 확장**

1. Cursor에서 확장 마켓플레이스 열기 (`Ctrl+Shift+X`)
2. **"Rojo"** 검색 후 **Rojo** (evaera.vscode-rojo) 설치
3. 확장으로 Rojo 서버 시작 가능. 스튜디오 플러그인은 방법 A 한 번 실행 또는 마켓플레이스에서 설치.

**방법 C: CLI 수동 설치**

1. [Rojo 7 릴리스](https://github.com/rojo-rbx/rojo/releases)에서 `rojo-*-windows-x86_64.zip` 다운로드
2. 압축 해제 후 `rojo.exe`를 PATH에 추가하거나 프로젝트 `tools/rojo/`에 넣어 사용

### 5-2. Roblox Studio 플러그인 설치

1. Roblox Studio 실행
2. **앱 탭** → **플러그인** → **플러그인 개발** 또는 [Rojo 7 플러그인 페이지](https://www.roblox.com/library/6415005344/Rojo-7)에서 **Rojo 7** 설치
3. 설치 후 스튜디오를 한 번 종료했다가 다시 켜면 **Rojo** 메뉴/버튼이 보입니다.

### 5-3. 플레이 테스트 절차

1. **Cursor**에서 프로젝트 폴더(`TowerRush_Project`) 열기
2. **Rojo 서버 실행**
   - 프로젝트 루트에서: `.\scripts\start-rojo.ps1`  
   - 또는 Cursor: `Ctrl+Shift+P` → **Rojo: Start Rojo Server** (확장 사용 시)  
   - 또는 터미널: `tools\rojo\rojo.exe serve` (로컬 설치 후)
3. **Roblox Studio** 실행
4. **새 Baseplate(또는 빈 플레이스)** 만들기 (기존 플레이스에 연동해도 됨)
5. 스튜디오에서 **Rojo** 플러그인 클릭 → **Connect** → 주소 **127.0.0.1**, 포트 **34872** 입력
6. 연결되면 `src/` 안의 스크립트가 스튜디오에 실시간 동기화됩니다.
7. **플레이(F5)** 로 테스트. Output 창에서 `[Server]`, `[Client]` 로그로 동작 확인.

### 5-4. 프로젝트 구조 (Rojo)

| 폴더 / 파일 | 스튜디오 위치 | 설명 |
|-------------|----------------|------|
| `src/ServerScriptService/*.server.lua` | ServerScriptService | 서버 스크립트 |
| `src/StarterPlayerScripts/*.client.lua` | StarterPlayer > StarterPlayerScripts | 클라이언트 스크립트 |
| `src/ReplicatedStorage/*.lua` | ReplicatedStorage | 공용 모듈 |
| `src/Workspace/` | Workspace | 맵/파츠 등 |

파일 이름 규칙: `*.server.lua` → Script, `*.client.lua` → LocalScript, `*.lua` → ModuleScript.

### 5-5. 문제 해결

**Rojo가 플러그인 메뉴에 두 개 보일 때**

- Cursor/VS Code Rojo 확장과 CLI 설치가 둘 다 플러그인을 넣어서 생기는 경우입니다.
- **Roblox Studio를 완전히 종료**한 뒤, 프로젝트 루트에서:
  ```powershell
  .\scripts\fix-rojo-plugins.ps1
  ```
- 이 스크립트는 기존 Rojo 플러그인을 제거한 뒤, 공식 플러그인 하나만 다시 설치합니다. 스튜디오를 다시 실행하면 Rojo가 하나만 보입니다.

**연결이 안 될 때**

1. **Rojo 서버가 켜져 있는지 확인**  
   터미널에서 `.\scripts\start-rojo.ps1` 실행 후 `Rojo server listening` 메시지가 나와야 합니다. 그 상태에서 스튜디오에서 Connect 하세요.
2. **주소/포트**  
   Connect 시 주소에 **127.0.0.1**, 포트에 **34872** 를 입력하세요. (`localhost` 대신 `127.0.0.1` 사용 권장)
3. **방화벽**  
   Windows 방화벽에서 포트 34872가 차단되지 않았는지 확인하세요.
4. **한 번에 하나만**  
   Rojo 서버는 이 프로젝트 폴더에서만 한 번 실행하세요. 다른 터미널이나 확장에서 중복 실행하면 연결이 꼬일 수 있습니다.

**그 외**

- **스크립트가 안 보임**: Rojo Connect 성공 후 스튜디오에서 ServerScriptService, StarterPlayerScripts 등 트리를 새로고침해 보세요.
- **수정이 반영 안 됨**: 파일 저장(`Ctrl+S`) 후 자동 동기화 대기. 필요 시 Rojo에서 Sync 다시 실행.

---

## 6. Wally (패키지 매니저, 선택)

Lua 패키지(라이브러리)를 쓸 때 **Wally**로 설치합니다. Rojo와 연동되어 `ReplicatedStorage.Packages`에 패키지가 올라갑니다.

### 6-1. Wally CLI 설치

프로젝트 루트에서:

```powershell
.\scripts\install-wally.ps1
```

Wally가 `tools/wally/`에 설치됩니다 (Rojo와 마찬가지로 `tools/`는 .gitignore 대상).

### 6-2. 패키지 설치

`wally.toml`에 의존성을 추가한 뒤:

```powershell
.\scripts\install-wally-packages.ps1
```

또는 `tools\wally\wally.exe install` 을 직접 실행해도 됩니다. 설치된 패키지는 `Packages/` 폴더에 들어가며, Rojo가 **ReplicatedStorage.Packages**로 동기화합니다.

### 6-3. 패키지 사용 예

게임 스크립트에서:

```lua
local SomePackage = require(ReplicatedStorage.Packages["scope-package-name"])
```

`wally.toml`의 `[dependencies]`에 추가한 패키지 이름(scope/name)에 맞게 경로를 넣으면 됩니다.

---

## 7. 작업 후 GitHub에 반영하기

코드를 수정한 뒤, 아래 순서로 푸시합니다.

```powershell
cd TowerRush_Project

# 변경 사항 확인
git status

# 모든 변경 파일 스테이징
git add .

# 커밋 (메시지는 수정 내용에 맞게)
git commit -m "작업 내용 요약"

# GitHub에 푸시
git push origin main
```

최초 푸시 시 GitHub 로그인(또는 Personal Access Token) 입력이 필요할 수 있습니다.

---

## 8. 다른 PC에서 최신 코드 받기

다른 PC에서 작업한 내용을 이 PC로 가져올 때:

```powershell
cd TowerRush_Project
git pull origin main
```

---

## 체크리스트 (새 PC에서)

- [ ] Git 설치 및 `git --version` 확인
- [ ] `git clone`으로 저장소 클론
- [ ] `git config --global` 로 user.name, user.email 설정
- [ ] Cursor(또는 VS Code)로 폴더 열기
- [ ] (선택) GitHub 로그인/토큰 설정 후 `git push` 테스트
- [ ] (로블록스) Rojo 설치 + 스튜디오 플러그인 설치 후 Connect → 플레이 테스트

---

## 문제 해결

### 푸시 시 인증 실패
- GitHub에서 **Settings → Developer settings → Personal access tokens** 로 토큰 생성
- 비밀번호 대신 토큰을 입력하거나, **Git Credential Manager**로 로그인

### `git pull` 시 충돌
- 로컬에서 수정한 파일과 원격 변경이 겹치면 충돌 메시지가 나옵니다.
- 에디터에서 충돌 부분 수정 후 `git add .` → `git commit` → `git push`

이 가이드로 새 데스크톱에서도 동일한 환경으로 이어서 개발할 수 있습니다.
