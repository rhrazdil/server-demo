FROM golang:1.15.8

ENV APP_NAME server-demo
ENV PORT 8080

COPY . /go/src/${APP_NAME}
WORKDIR /go/src/${APP_NAME}/src

RUN go build -o ${APP_NAME}

CMD ./${APP_NAME}

EXPOSE ${PORT}