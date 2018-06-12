FROM ubuntu:18.04

# latest python3 distro on ubuntu 18.04
RUN apt update && \
    apt install -y python3-dev python3-pip ffmpeg && \
    rm -rf /var/lib/apt/lists/*/

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip3 install -r requirements.txt

COPY . .
