# ---------- Stage 1: build bootJar bằng Gradle Wrapper ----------
FROM eclipse-temurin:17-jdk AS builder
WORKDIR /build

# Copy cấu hình Gradle trước để tận dụng layer cache cho dependency
COPY gradlew settings.gradle build.gradle ./
COPY gradle ./gradle
RUN chmod +x gradlew && ./gradlew dependencies --no-daemon > /dev/null

# Copy mã nguồn và đóng gói (test đã chạy ở workflow CI)
COPY src ./src
RUN ./gradlew bootJar -x test --no-daemon

# ---------- Stage 2: runtime chỉ có JRE + app.jar ----------
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
RUN addgroup -S app && adduser -S app -G app
COPY --from=builder /build/build/libs/*.jar app.jar
USER app
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
