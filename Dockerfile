FROM ubuntu:20.04

RUN apt update && apt install -y g++ cmake

COPY . /print
WORKDIR /print

RUN rm -rf _build
RUN cmake -H. -B_build -DCMAKE_BUILD_TYPE=Release
RUN cmake --build _build

ENV LOG_PATH=/logs/log.txt

VOLUME /logs

WORKDIR /print/_build

ENTRYPOINT ["./demo"]
