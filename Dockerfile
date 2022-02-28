FROM python:3-buster

RUN apt update && apt install -y sshpass
RUN pip3 install ansible
ADD requirements.txt /requirements.txt
RUN pip3 install -r /requirements.txt
RUN mkdir /workspace
WORKDIR /workspace
