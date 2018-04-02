FROM ruby:2.4.1

RUN apt-get update && apt-get -y install curl git nano



RUN mkdir /app
RUN mkdir /app/sd
WORKDIR /app/sd

ADD Gemfile /app/sd/
ADD Gemfile.lock /app/sd/

RUN cd /app/sd && bundle install

RUN apt-get -y install nodejs

ADD . /app/sd/
