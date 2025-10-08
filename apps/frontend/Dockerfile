FROM node:20-alpine
WORKDIR /app

# deps 설치
COPY package*.json ./
RUN npm ci

# 소스는 볼륨으로 붙일 예정이라 여기선 복사 안 함
EXPOSE 5174
CMD ["npm","run","dev","--","--host","0.0.0.0","--port","5174"]