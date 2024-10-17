FROM ubuntu

MAINTAINER Maintainer duberly.mondragon@tecsup.edu.pe

# Instalar lsb-release para obtener la versión de Ubuntu
RUN apt-get update && apt-get install -y lsb-release

RUN echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe" >> /etc/apt/sources.list

RUN apt-get update

RUN apt-get install -y tar git curl nano wget dialog net-tools build-essential
RUN apt-get install -y python python-dev python-distribute python-pip
RUN git clone https://github.com/Duberly2004/docker_flask_example

# Verifica que el path es correcto para requirements.txt
RUN pip install -r /my_application/requirements.txt

EXPOSE 80

WORKDIR /my_application

CMD python server.py
