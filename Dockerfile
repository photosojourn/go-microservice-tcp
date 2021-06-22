FROM golang:1.13-alpine AS build

#Install git
RUN apk add --no-cache git
RUN go get github.com/photosojourn/go-microservice-tcp
WORKDIR /go/src/github.com/photosojourn/go-microservice-tcp
RUN go build -o /bin/go-microservice-tcp

FROM golang:1.13-alpine
COPY --from=build /bin/go-microservice-tcp /bin/go-microservice-tcp
EXPOSE 8080
ENTRYPOINT ["/bin/go-microservice-tcp 8080"]
