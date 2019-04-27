FROM ubuntu:14.04
RUN apt update && apt -y install git
RUN git clone https://github.com/GrayMonk90/testwork1.git
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all python-pip
RUN cp /testwork1/requirements.txt /tmp/requirements.txt
RUN cd /tmp && pip install -qr ./requirements.txt
RUN mkdir -p /opt/webapp && cp /testwork1/* /opt/webapp
WORKDIR /opt/webapp
EXPOSE 5000
CMD ["python", "app.py"]
