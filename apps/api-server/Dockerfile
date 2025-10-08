# 1) Build stage
FROM eclipse-temurin:17-jdk-jammy AS builder
WORKDIR /apps

# Gradle wrapper & 메타만 먼저 복사 (캐시 최적화)
COPY ./gradlew ./gradlew
COPY ./gradle ./gradle
COPY ./settings.gradle ./settings.gradle
COPY ./build.gradle ./build.gradle

RUN chmod +x ./gradlew
# 의존성만 먼저 당겨 캐시
RUN ./gradlew --no-daemon dependencies || true

# 소스 복사 (이제야!)
COPY ./src ./src

# 빌드 (테스트 스킵 권장)
RUN ./gradlew clean build -x test --no-daemon --stacktrace

# 2) Runtime stage (JRE)
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
COPY --from=builder /apps/build/libs/*.jar ./app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
