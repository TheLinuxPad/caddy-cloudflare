FROM caddy:builder AS builder

RUN GOARCH=arm/v7

RUN xcaddy build \
    --with  github.com/caddy-dns/cloudflare

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
