FROM --platform=$BUILDPLATFORM alpine AS builder

ARG TARGETARCH
ARG TARGETOS

RUN apk add --no-cache go curl

ENV APP_NAME server-demo
ENV GOPATH /go
ENV PATH /go/bin:$PATH

COPY . /go/src/${APP_NAME}
WORKDIR /go/src/${APP_NAME}/src

RUN GOOS=$TARGETOS GOARCH=$TARGETARCH go build -o /go/bin/${APP_NAME}

FROM alpine

ENV APP_NAME server-demo
ENV PORT 8080

COPY --from=builder /go/bin/${APP_NAME} /${APP_NAME}

EXPOSE ${PORT}
CMD ["/server-demo"]
