FROM ubuntu:16.04
MAINTAINER Chen Yuelong <yuelong.chen.btr@gmail.com>


ARG samtools_version=1.9


# Update the repository sources list and install samtools package
RUN apt-get update && \
    apt-get install --yes wget autoconf automake make gcc perl bzip2 \
                          zlib1g-dev libbz2-dev \
                          liblzma-dev libcurl4-gnutls-dev libssl-dev libncurses5-dev && \
    cd /tmp/ && \
    wget https://github.com/samtools/samtools/releases/download/$samtools_version/samtools-$samtools_version.tar.bz2 && \
    tar -jxvf samtools-$samtools_version.tar.bz2 && \
    cd samtools-$samtools_version && \
    ./configure && make && make install

# clean
RUN rm -rf /tmp/samtools && \
    apt-get clean && \
    apt-get remove --yes --purge build-essential gcc-multilib apt-utils zlib1g-dev wget



CMD samtools