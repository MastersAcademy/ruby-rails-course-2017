FROM ruby:2.4.1

RUN apt-get update && apt-get -y install curl git nano

RUN mkdir /app
RUN mkdir /app/hata
WORKDIR /app/hata

ADD Gemfile /app/hata/Gemfile
ADD Gemfile.lock /app/hata/Gemfile.lock

RUN cd /app/hata && bundle install

RUN apt-get -y install nodejs

ADD . /app/hata/
