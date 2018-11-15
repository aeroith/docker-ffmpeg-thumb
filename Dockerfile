FROM jrottenberg/ffmpeg
LABEL maintainer="Serhat Cillidag scillidag@gmail.com"

RUN apt-get update && \
    apt-get install python-dev python-pip -y && \
    apt-get clean

RUN pip install awscli

WORKDIR /tmp/workdir

COPY run.sh /tmp/workdir

ENTRYPOINT ./run.sh
