# https://github.com/ufoscout/docker-compose-wait

This is made from [https://github.com/ufoscout/docker-compose-wait](https://github.com/ufoscout/docker-compose-wait)

## version

current version is 2.5.0

For detail, visit [https://github.com/ufoscout/docker-compose-wait/releases](https://github.com/ufoscout/docker-compose-wait/releases)

## image

```
docker pull sillydong/wait:2.5.0
```

## example

app dockerfile

```
ARG GO_VERSION=latest

FROM golang:${GO_VERSION} as build
ARG GO_LDFLAGS="-s -w"
ENV CGO_ENABLED 0
RUN mkdir -p /go/src
COPY src/. /go/src/
WORKDIR /go/src/foo/bar/cmd
RUN go build -ldflags "${GO_LDFLAGS}" .

FROM sillydong/wait:2.5.0
EXPOSE 80
EXPOSE 81
COPY --from=build /go/src/foo/bar/cmd/cmd /bin/
CMD /bin/wait && /bin/cmd
```

docker-compose.yaml

```
version: "3"

services:
  db:
    container_name: db
    image: circleci/postgres:10.1-alpine
    ports:
      - 5433:5432
    environment:
      - POSTGRES_USER=a
      - POSTGRES_PASSWORD=b
      - POSTGRES_DB=c
  cmd:
    container_name: cmdimage
    image: cmdimage:latest
    ports:
      - 80:80
    environment:
      WAIT_HOSTS: db:5432
      DSN: postgres://a:b@db:5432/c
```

For detail, visit [https://github.com/ufoscout/docker-compose-wait/blob/master/README.md](https://github.com/ufoscout/docker-compose-wait/blob/master/README.md)
