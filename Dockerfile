FROM ubuntu:14.04
RUN apt update && mkdir /root/testwork1
COPY . /root/testwork1
RUN mv /root/testwork1/requirements.txt /tmp/requirements.txt
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq python-all python-pip && pip install -r /tmp/requirements.txt
RUN mkdir /opt/webapp && cp /root/testwork1/* /opt/webapp
WORKDIR /opt/webapp
EXPOSE 5000
CMD ["python", "app.py"]
