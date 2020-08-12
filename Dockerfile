FROM golang:1.14.7 as backend


WORKDIR /go/src/github.com/hanxinhisen/thc_moss


COPY cmd /go/src/github.com/hanxinhisen/thc_moss/cmd
COPY pkg /go/src/github.com/hanxinhisen/thc_moss/pkg
COPY go.mod /go/src/github.com/hanxinhisen/thc_moss
COPY go.sum /go/src/github.com/hanxinhisen/thc_moss


RUN export GO111MODULE=on && \
    export GOPROXY=https://goproxy.cn && \
    go build cmd/server/main.go && \
    mv main thc_moss

FROM 360cloud/centos:7

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

COPY --from=backend /go/src/github.com/hanxinhisen/thc_moss/thc_moss /opt/thc_moss/

WORKDIR /opt/thc_moss/


CMD ["./thc_moss"]
