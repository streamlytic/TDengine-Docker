FROM ubuntu AS build-env

RUN apt-get update
RUN apt-get -y install git
RUN apt-get -y install build-essential
RUN apt-get -y install cmake

RUN git clone https://github.com/taosdata/TDengine.git
RUN mkdir build && cd build && cmake ../TDengine && cmake --build .


FROM ubuntu
WORKDIR /app
ADD ./taos.cfg /app
COPY --from=build-env /build/build/bin/* /app/
RUN mkdir -p /data/log
ENTRYPOINT ["./taosd", "-c", "."]
