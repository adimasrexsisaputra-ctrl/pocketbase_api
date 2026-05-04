FROM alpine:3.19

WORKDIR /app

RUN apk add --no-cache unzip wget

# ganti versi kalau mau (cek di release PocketBase)
ENV PB_VERSION=0.22.0

RUN wget https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip \
 && unzip pocketbase_${PB_VERSION}_linux_amd64.zip \
 && chmod +x pocketbase

EXPOSE 8080

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8080"]
