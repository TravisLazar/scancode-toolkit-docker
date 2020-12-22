FROM python:3.6

ENV BUILD_VERSION=3.2.3

RUN apt-get update
RUN apt-get install bzip2 xz-utils zlib1g libxml2-dev libxslt1-dev

ADD "https://github.com/nexB/scancode-toolkit/archive/v${BUILD_VERSION}.tar.gz" scancode-toolkit.tar.gz
RUN mkdir scancode-toolkit && tar -xf scancode-toolkit.tar.gz -C scancode-toolkit --strip-components 1

WORKDIR scancode-toolkit

RUN ./configure

ENV PATH=$HOME/scancode-toolkit:$PATH
