-----

# ⚡️ Web Server Template – 빠르게 시작하는 풀스택 환경

이 템플릿은 **Vite(Frontend)**, **NestJS(Real-Time Server)**, **Spring Boot(API Server)** 3가지 서버를 즉시 실행 가능한 상태로 구성한 올인원 웹 서버 스타터입니다. 복잡한 설정 없이, 단 한 번의 명령으로 개발 환경을 완성할 수 있습니다.

-----

## 🚀 핵심 특징

### 1\. 바로 실행 가능한 환경

  - Shell 실행 스크립트(**`dc.sh`**)로 각 서버를 선택하여 손쉽게 실행할 수 있습니다.
  - 필요 시 **Docker Compose**로 통합 실행도 지원합니다.
  - CORS, DB, 네트워크, 포트 설정이 이미 완벽히 구성되어 있어 따로 수정할 필요가 없습니다.

### 2\. 손쉬운 환경 설정 관리

  - **NestJS**: `env_example` 파일을 복사하여 `.env`로 이름만 바꾸면 즉시 사용 가능합니다.
  - **Spring Boot**: `properties_example` 파일을 복사하여 `application.properties`로 설정하면 끝\!

**예시:**

```env
# apps/real-time-server/.env
DB_HOST=host.docker.internal
DB_PORT=5432
DB_NAME=db_name
DB_USER=db_user
DB_PASS=db_pass
DB_SSL=false
NODE_ENV=development
```

```properties
# apps/api-server/src/main/resources/application.properties
spring.datasource.url=jdbc:postgresql://host.docker.internal:5432/db_name
spring.datasource.username=username
spring.datasource.password=password
spring.datasource.driver-class-name=org.postgresql.Driver
```

-----

## 💻 실행 방법

### 🟢 1. Shell 스크립트로 실행 (추천)

이 템플릿에는 `dc.sh` 라는 인터랙티브 실행 스크립트가 포함되어 있습니다.

```bash
# 실행 권한 부여 (최초 1회)
chmod +x dc.sh

# 실행
./dc.sh
```

✨ 2. Makefile 단축 명령어 (선택 사항)

Makefile 사용에 익숙한 분들을 위해 단축 명령어를 제공합니다.
아래 명령어를 실행하면 1번의 ./dc.sh 스크립트가 동일하게 실행됩니다.

```bash
# 인터랙티브 스크립트 실행
make build
```

스크립트를 실행하면 다음과 같은 메뉴가 나타납니다:

```
-------------------------------
빌드+실행(실시간 로그) 대상 선택:
  1) frontend
  2) real-time-server
  3) api-server
  a) all (전체)
  q) quit (종료)
-------------------------------
번호를 선택하세요:
```

  - **숫자** 입력 시 해당 서버만 빌드 + 실행 + 로그 표시
  - **`a`** 입력 시 모든 서버가 동시에 실행
  - **`q`** 입력 시 종료

**예시 흐름:**

```bash
$ ./dc.sh
번호를 선택하세요: 1
🚀 docker compose up --build frontend
[+] Building frontend ...
[+] Running frontend on http://localhost:5174
```

이처럼 메뉴에서 선택만 하면 바로 실행되며, 각 서버의 실시간 로그가 출력됩니다.

-----

### 🐳 2. Docker Compose로 직접 실행

필요할 경우, 모든 서버를 도커 컨테이너로 통합 실행할 수도 있습니다.

```bash
# 전체 서버 빌드 및 실행
docker compose up --build

# 또는 특정 서버만 실행
# 프론트엔드만
docker compose --profile frontend up --build
# 실시간 서버만
docker compose --profile real-time-server up --build
# API 서버만
docker compose --profile api-server up --build
```

모든 서버는 자동으로 동일한 네트워크(**`my-app-network`**) 내에서 연결됩니다.
브라우저에서 `http://localhost:<포트>`로 접속하면 각 서비스 확인이 가능합니다.

-----

## ⚙️ 기본 설정 포함 사항

| 항목 | 설명 |
| :--- | :--- |
| **CORS** | 프론트엔드 개발 서버(`http://localhost:5174`, `http://127.0.0.1:5174`)의 요청을 허용하도록 NestJS와 Spring Boot에 모두 설정되어 있습니다. 인증 정보(Credentials) 전송 및 모든 표준 HTTP 메서드가 허용됩니다. |
| **DB 연결** | Postgres/MySQL 등 외부 DB에 바로 연결 가능 (템플릿에 예시 포함) |
| **네트워크** | `bridge` 기반의 `my-app-network`로 모든 컨테이너가 자동 연결 |
| **핫 리로드** | `frontend`와 `api-server`는 코드 수정 시 자동 반영 |

-----

## 🧱 폴더 구조 예시

```
apps/
├── frontend/             # Vite 기반 프론트엔드
├── real-time-server/     # NestJS 실시간 서버
│   └── env_example       # 환경 변수 예시
└── api-server/           # Spring Boot API 서버
    └── properties_example  # 설정 파일 예시
```

-----

## 🚀 왜 이 템플릿인가?

이 템플릿은 복잡한 설정 과정을 제거하고, 개발자가 즉시 핵심 기능 개발에 집중할 수 있도록 설계되었습니다.

#### ⏰ 즉각적인 개발 시작
- **Zero-Config에 가까운 경험**: CORS, DB, 네트워크 등 번거로운 인프라 설정이 모두 완료되어 있습니다. `git clone` 후 바로 개발을 시작하세요.
- **통합된 풀스택 환경**: 프론트엔드, API 서버, 실시간 서버가 유기적으로 연결되어 있어 MSA(마이크로서비스 아키텍처) 구조를 손쉽게 테스트하고 개발할 수 있습니다.

#### 💻 압도적인 개발 편의성
- **인터랙티브 실행 스크립트**: `dc.sh` 스크립트가 제공하는 메뉴를 통해, Docker 명령어를 몰라도 원하는 서버를 골라 즉시 실행하고 로그를 확인할 수 있습니다.
- **빠른 개발 사이클**: 코드 수정 시 즉시 반영되는 핫 리로드(Hot Reload)와 특정 서버만 실행하는 프로필 기능을 통해 개발 속도를 극대화합니다.

#### 🚢 안정적인 배포와 운영
- **개발-운영 환경 일치**: Docker 기반으로 개발 환경을 구성하여, 로컬과 실제 서버 환경의 차이로 인해 발생하는 배포 오류를 원천적으로 방지합니다.

-----

## 📜 라이선스

**MIT**
