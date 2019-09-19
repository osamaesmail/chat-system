FROM golang:1.12

ADD . /go/src/chat-creation-endpoint
WORKDIR /go/src/chat-creation-endpoint

RUN go get .
RUN go build

EXPOSE 3001

ENTRYPOINT ["/go/bin/chat-creation-endpoint"]