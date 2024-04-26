# syntax=docker/dockerfile:1
FROM lscr.io/linuxserver/code-server AS server

RUN apt-get -y update 
RUN apt install -y docker.io
RUN docker --version
RUN apt install -y python3 python3-pip
RUN apt install -y nodejs npm
RUN apt install -y iputils-ping
RUN pip3 install Flask

