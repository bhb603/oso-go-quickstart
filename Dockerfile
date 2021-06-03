FROM golang:1.16.3-alpine3.13 as build

RUN apk add --no-cache --no-progress --update git gcc g++

WORKDIR /project
COPY go.mod .
RUN go mod download

COPY . .

RUN CGO_ENABLED=1 GOOS=linux go build -mod=readonly -tags nomsgpack,osusergo,netgo \
  -o /tmp/quickstart

FROM alpine:3.13
COPY --from=build /tmp/quickstart /quickstart
COPY expenses.polar /expenses.polar

CMD ["/quickstart"]
