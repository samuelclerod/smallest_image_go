FROM golang:1.18 AS builder

WORKDIR /app

COPY go.* ./

RUN go mod download

COPY *.go ./

RUN go build -o /codeeducation


FROM scratch

WORKDIR /

COPY --from=builder /codeeducation /codeeducation

CMD ["/codeeducation"]
