FROM alpine:3.19

WORKDIR /app

RUN apk add --no-cache unzip wget

# download PocketBase langsung dari source
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.22.0/pocketbase_0.22.0_linux_amd64.zip \
 && unzip pocketbase_0.22.0_linux_amd64.zip \
 && chmod +x pocketbase

EXPOSE 8080

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8080"]