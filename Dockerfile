FROM debian:stretch-slim

EXPOSE 9097

RUN apt update
RUN apt install python3-pip python3-lxml -y
RUN pip3 install peewee requests requests_oauthlib py-trello pytz python-dateutil beautifulsoup4
RUN pip3 install pydevd-pycharm~=191.7141.48

COPY main.py /working_dir/
COPY models.py /working_dir/
COPY trello_module.py /working_dir/
COPY database.sqlite /working_dir/

COPY trello.json /working_dir/
COPY parameters.json /working_dir/

COPY scrapping_modules /working_dir/scrapping_modules/

WORKDIR /working_dir

#RUN mvn dependency:go-offline
#
#COPY src src/
#
#RUN mvn -T1C -Pcoverage-per-test clean install -U
#
#WORKDIR /dist
#
#RUN cp -r /working_dir/target/xbox*.war ./xbox.war