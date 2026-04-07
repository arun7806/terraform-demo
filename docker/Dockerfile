FROM alpine:3.19

RUN apk add --no-cache busybox-extras

EXPOSE 4000

CMD ["sh", "-c", "while true; do echo 'Hello' | nc -l -p 4000; done"]