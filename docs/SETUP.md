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

## 5. 작업 후 GitHub에 반영하기

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

## 6. 다른 PC에서 최신 코드 받기

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

---

## 문제 해결

### 푸시 시 인증 실패
- GitHub에서 **Settings → Developer settings → Personal access tokens** 로 토큰 생성
- 비밀번호 대신 토큰을 입력하거나, **Git Credential Manager**로 로그인

### `git pull` 시 충돌
- 로컬에서 수정한 파일과 원격 변경이 겹치면 충돌 메시지가 나옵니다.
- 에디터에서 충돌 부분 수정 후 `git add .` → `git commit` → `git push`

이 가이드로 새 데스크톱에서도 동일한 환경으로 이어서 개발할 수 있습니다.
