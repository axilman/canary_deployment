FROM golang:1-alpine as build

ARG version=1.0
WORKDIR /
COPY source source
RUN go build source/$version/app.go

FROM alpine:latest

WORKDIR /
COPY --from=build /app /app

EXPOSE 8080
ENTRYPOINT ["/app"]
