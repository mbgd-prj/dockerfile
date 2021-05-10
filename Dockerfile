FROM ubuntu:20.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget build-essential

WORKDIR /opt
RUN wget http://mbgd.genome.ad.jp/domclust/domclust.tgz && \
    tar zxvf domclust.tgz && rm domclust.tgz && \
    cd /opt/domclust && \
    make
ENV PATH /opt/domclust/bin/:$PATH

RUN wget http://mbgd.genome.ad.jp/domrefine/domrefine1.1.1.tgz && \
    tar zxvf domrefine1.1.1.tgz && rm domrefine1.1.1.tgz && \
    cd /opt/domrefine1.1.1/lib && \
    wget http://www.clustal.org/omega/clustalo-1.2.4-Ubuntu-x86_64 && mv clustalo-1.2.4-Ubuntu-x86_64 clustalo && chmod +x clustalo
ENV PATH /opt/domrefine1.1.1/:/opt/domrefine1.1.1/bin/:/opt/domrefine1.1.1/bin_dev/:/opt/domrefine1.1.1/lib/:$PATH

WORKDIR /work
