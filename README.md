# Speed Scope Dockerize

## About

Automatically push new docker image to [https://hub.docker.com/r/mortum5/speedscope](https://hub.docker.com/r/mortum5/speedscope) when new tag release add in [repository](https://github.com/jlfwong/speedscope).

## Run

```sh
docker run --rm --name speedscope -p 8080:8080 mortum5/speedscope
```