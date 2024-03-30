FROM golang:1.22.0

WORKDIR /go/src/app

COPY go.mod go.sum ./

RUN go mod download

COPY *.go tracker.db ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /docker-project

CMD ["/docker-project"]