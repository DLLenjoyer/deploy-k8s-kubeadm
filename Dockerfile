FROM golang:1.18 as builder
WORKDIR /app
COPY . .
RUN go build -o hello-world-app

FROM gcr.io/distroless/base-debian10
COPY --from=builder /app/hello-world-app /
EXPOSE 8082
ENTRYPOINT ["/hello-world-app"]
