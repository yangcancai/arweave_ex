FROM ubuntu:16.04
ENV TERM=xterm
ENV LANG=en_US.UTF-8

RUN apt-get update && apt-get install -y wget curl make iproute2 vim-tiny inotify-tools
RUN apt-get install -y --no-install-recommends locales git postgresql-client

RUN echo $LANG UTF-8 > /etc/locale.gen \
    && locale-gen \
    && update-locale LANG=$LANG

RUN apt-get install build-essential zlib1g-dev -y
#openssl openssl-devel
RUN wget https://ftp.openssl.org/source/openssl-1.1.1k.tar.gz --no-check-certificate &&\
    tar -xzvf openssl-1.1.1k.tar.gz &&\
     cd openssl-1.1.1k &&\
    ./config --prefix=/usr --openssldir=/etc/ssl --libdir=lib no-shared zlib-dynamic &&\
    make && make install

#SHELL ["/bin/bash", "-lc"]
ENV ERLANG_VERSION=24.2.1
ENV ELIXIR_VERSION=1.14.4
RUN apt-get install unzip && \
    apt-get install libssl-dev automake autoconf libncurses5-dev -y

ENV ASDF_ROOT /root/.asdf
ENV PATH "${ASDF_ROOT}/bin:${ASDF_ROOT}/shims:$PATH"

RUN git clone https://github.com/asdf-vm/asdf.git ${ASDF_ROOT} --branch v0.8.1  &&\
      asdf plugin add erlang  && \
      asdf plugin add elixir && \
      CFLAGS="-O2 -g" asdf install erlang $ERLANG_VERSION && \
      asdf install elixir $ELIXIR_VERSION && \
      asdf global erlang $ERLANG_VERSION && \
      asdf global elixir $ELIXIR_VERSION

RUN wget https://cmake.org/files/v3.20/cmake-3.20.0-linux-x86_64.tar.gz && \
    tar -xvf cmake-3.20.0-linux-x86_64.tar.gz && \
    cp -r cmake-3.20.0-linux-x86_64 /usr/local/ && \
    ln -s  /usr/local/cmake-3.20.0-linux-x86_64/bin/cmake /usr/bin/cmake

ENV ASDF_DATA_DIR=$ASDF_ROOT
ENV HOME /home/developer
WORKDIR /home/developer/prj


CMD /bin/bash