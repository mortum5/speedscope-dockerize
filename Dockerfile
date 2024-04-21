FROM golang:1.21-alpine

ARG UID=10001
RUN adduser \
    --disabled-password \
    --gecos "" \
    --shell "/sbin/nologin" \
    --uid "${UID}" \
    speedscope
USER speedscope
EXPOSE 8080

RUN go install github.com/mortum5/go-playground/file-server@latest
COPY docker-entrypoint.sh /

WORKDIR /tmp
COPY speedscope/* .

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD ["go", "run", "github.com/mortum5/go-playground/file-server@latest"]