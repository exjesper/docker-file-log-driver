FROM golang:1.10-alpine

RUN apk update && \
	apk add git

WORKDIR /go/src/github.com/deep-compute/docker-file-log-driver

COPY . /go/src/github.com/deep-compute/docker-file-log-driver
RUN go get
RUN go build --ldflags '-extldflags "-static"' -o /usr/bin/docker-file-log-driver
RUN rm -rf /go/src
