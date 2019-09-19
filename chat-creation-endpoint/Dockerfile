FROM golang:latest

WORKDIR /go/src/chat-creation-endpoint
ADD . .
RUN go get .
RUN GOOS=linux go build -a -o build .

EXPOSE 3001

ENTRYPOINT ["/go/bin/chat-creation-endpoint"]