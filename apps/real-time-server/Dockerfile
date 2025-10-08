# 1) Build stage
FROM node:20-alpine AS builder
WORKDIR /app

# 의존성만 먼저 설치 (캐시 최적화)
COPY package*.json ./
RUN npm ci

# 소스 복사 후 빌드
COPY . .
# Prisma 사용 시: 스키마로 클라이언트 생성
# RUN npx prisma generate

# Nest 빌드 (dist 생성)
RUN npm run build

# 2) Runtime stage (작고 빠른 이미지)
FROM node:20-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production

# 런타임에 필요한 파일만 복사
COPY package*.json ./
RUN npm ci --omit=dev

# 빌드 산출물만 복사
COPY --from=builder /app/dist ./dist

# (Prisma 사용 시) 스키마와 클라이언트 포함
# COPY prisma ./prisma
# RUN npx prisma generate

# 포트
EXPOSE 3000

# 헬스체크(선택): GET /health 엔드포인트가 있을 때
# HEALTHCHECK --interval=30s --timeout=3s --retries=3 CMD wget -qO- http://localhost:3000/health || exit 1

# 앱 실행
CMD ["node", "dist/main.js"]