FROM golang:1.22-alpine3.19

WORKDIR /app

COPY . .



RUN go get github.com/lib/pq

RUN go mod tidy

RUN go build -o api .

EXPOSE 8000

CMD [ "./api" ]