FROM ubuntu:trusty

RUN apt-get -y update \
    && apt-get -y install libmysqlclient-dev \ 
    graphviz \ 
    python-pip \
    python-dev \ 
    build-essential \ 
    git 

RUN pip install --upgrade pip \
    && pip install --allow-unverified pydot pydot==1.0.28 \ 
    && pip install pinball

RUN git clone https://github.com/pinterest/pinball.git /pinball \
    && cp -r /pinball/tutorial /mnt

ADD config.yaml /mnt/config.yaml
ADD start /pinball/start

VOLUME /mnt

WORKDIR /mnt

EXPOSE 8080 9090

ENTRYPOINT ["/pinball/start"]
