FROM ubuntu:18.04

# latest python3 distro on ubuntu 18.04
RUN apt update && \
    apt install -y python3-dev python3-pip ffmpeg

RUN mkdir ~/code
WORKDIR ~/code 
RUN pip3 install -r requirements.txt ~/code
ADD . ~/code/

