FROM golang:1.18 AS builder

WORKDIR /app

COPY . .

RUN go build -o main

FROM gcr.io/distroless/base-debian10

COPY --from=builder /app/main /

EXPOSE 8081

ENTRYPOINT ["/main"]
