FROM python:3-buster
ADD requirements.txt /requirements.txt
RUN pip3 install -r /requirements.txt
#RUN ansible-galaxy collection install openstack.cloud
