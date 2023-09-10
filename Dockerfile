FROM golang:alpine as builder
WORKDIR /go/src/app
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build main.go

FROM scratch

COPY --from=builder /go/src/app/main .

CMD ["./main"]
