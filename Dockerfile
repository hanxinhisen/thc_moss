FROM golang:1.14 as backend


WORKDIR /go/src/github.com/hanxinhisen/thc_moss/cmd/server

COPY cmd/server .

COPY go.mod /go/src/github.com/hanxinhisen/thc_moss

COPY go.sum /go/src/github.com/hanxinhisen/thc_moss

RUN export GO111MODULE=on && \
    go build main.go && \
    mv main thc_moss && /

FROM 360cloud/centos:7

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

COPY --from=backend /go/src/github.com/hanxinhisen/thc_moss/pack.tar /opt/thc_moss/

WORKDIR /opt/thc_moss/

RUN tar -xvf pack.tar

CMD ["./thc_moss"]