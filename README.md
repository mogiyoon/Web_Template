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

```ini
# apps/real-time-server/.env
PORT=3000
DATABASE_URL=postgres://user:password@localhost:5432/example_db
REDIS_URL=redis://localhost:6379
```

```properties
# apps/api-server/src/main/resources/application.properties
server.port=8080
spring.datasource.url=jdbc:postgresql://localhost:5432/example_db
spring.datasource.username=user
spring.datasource.password=password
spring.jpa.hibernate.ddl-auto=update
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
| **CORS** | 모든 서버 간 통신 허용 (로컬 환경 기본 허용) |
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

## 💨 이 템플릿을 사용하면 좋은 이유

✅ **Shell 스크립트 메뉴로 즉시 실행 가능** – 한 번의 선택으로 서버 구동 완료  
✅ **CORS, DB, 네트워크 설정 완료** – 바로 코드 작성 시작  
✅ **3개 서버 자동 연동** – 백엔드/프론트엔드 분리형 구조를 한 번에 테스트  
✅ **핫 리로드 & 프로필 실행 지원** – 원하는 서버만 빠르게 기동  
✅ **로컬 Shell 실행 + Docker 선택형** – 개발 단계에 따라 유연하게 사용 가능  
✅ **로컬-프로덕션 구조 일치** – 실환경으로 이전 시 최소 수정

-----

## 📜 라이선스

**MIT**
