FROM alpine

RUN apk add --no-cache go curl

# Configure Go
ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH

ENV APP_NAME server-demo
ENV PORT 8080

COPY . /go/src/${APP_NAME}
WORKDIR /go/src/${APP_NAME}/src

RUN go build -o ${APP_NAME}

CMD ./${APP_NAME}

EXPOSE ${PORT}