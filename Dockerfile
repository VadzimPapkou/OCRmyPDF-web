FROM jbarlow83/ocrmypdf

USER root

RUN mkdir /appp
WORKDIR /appp

ADD requirements.txt /appp

RUN . /appenv/bin/activate && pip install -r requirements.txt

ADD server.py index.htm entrypoint.sh /appp/
ADD static /appp/static/

USER docker

ENTRYPOINT ["/appp/entrypoint.sh"]
