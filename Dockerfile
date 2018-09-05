FROM golang:alpine AS build-env
ENV repo github.com/luizbranco/hlnr-test
WORKDIR /app
RUN apk update && apk add git && apk add ca-certificates
RUN go get -u ${repo}/cmd/server
RUN go build -o /app/server ${repo}/cmd/server

FROM alpine
ENV src /go/src/github.com/luizbranco/hlnr-test
WORKDIR /app
COPY --from=build-env /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=build-env /app/server /app

EXPOSE 8080
ENTRYPOINT ./server
