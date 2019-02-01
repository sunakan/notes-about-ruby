FROM ruby:2.6.0-stretch
RUN apt-get update -qq && apt-get install -y locales
RUN sed -i 's/#.*ja_JP\.UTF/ja_JP\.UTF/' /etc/locale.gen
RUN locale-gen && update-locale LANG=ja_JP.UTF-8
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN bundle install
