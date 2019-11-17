FROM debian:stretch-slim

WORKDIR /

COPY _output/bin/scheduler-framework-sample /usr/local/bin

CMD ["scheduler-framework-sample"]
