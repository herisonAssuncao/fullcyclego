FROM golang:1.20.1-alpine AS build

WORKDIR /app

RUN go mod init fullcyclego

RUN go mod download

RUN ls

COPY *.go ./

RUN go build -o /fullcyclego


FROM scratch

WORKDIR /

COPY --from=build /fullcyclego /fullcyclego

CMD [ "./fullcyclego" ]
