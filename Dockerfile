FROM golang:1.15-alpine as builder

WORKDIR /app

COPY . .

RUN go build -ldflags "-w"

FROM scratch

WORKDIR /app

COPY --from=builder /app/hello .

CMD [ "./hello" ]