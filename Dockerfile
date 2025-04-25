FROM alpine:latest

# Установим curl и tar
RUN apk add --no-cache curl tar

# Ставим V2Ray
ENV V2RAY_VERSION=5.30.0

RUN curl -L -o v2ray-linux.zip https://github.com/v2fly/v2ray-core/releases/download/v${V2RAY_VERSION}/v2ray-linux-64.zip && \
    mkdir -p /usr/local/bin/v2ray && \
    unzip v2ray-linux.zip -d /usr/local/bin/v2ray && \
    rm v2ray-linux.zip

# Порт который будем слушать
EXPOSE 1080 8080

# Минимальный запуск
CMD ["/usr/local/bin/v2ray/v2ray", "run", "-c", "/etc/v2ray/config.json"]
