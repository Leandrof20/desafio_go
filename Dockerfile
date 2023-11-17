FROM golang:1.21-alpine as builder

WORKDIR /usr/var

COPY . .

RUN go build -ldflags "-s -w" -gcflags "all=-l -B" .


FROM scratch

WORKDIR /usr/var

COPY --from=builder /usr/var/fullcycle .

ENTRYPOINT [ "./fullcycle" ]