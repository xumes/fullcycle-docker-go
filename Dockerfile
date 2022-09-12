FROM golang:1.15 as builder

WORKDIR /app

COPY . .

RUN go build

FROM scratch

WORKDIR /app

COPY --from=builder /app/hello .

CMD [ "./hello" ]