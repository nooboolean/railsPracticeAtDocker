FROM ruby:2.5.1

RUN curl -sL https://deb.nodesource.com/setup_10.x | \
    bash - && \
    apt-get update -qq && \
    apt-get install -y build-essential \
                       nodejs

RUN mkdir -p /var/www/html/src
WORKDIR /var/www/html/src

COPY Gemfile* ./

RUN bundle config --local build.mysql2 "--with-ldflags=-L/usr/local/opt/openssl/lib --with-cppflags=-I/usr/local/opt/openssl/include"

RUN bundle install

RUN mkdir -p tmp/sockets

RUN mkdir -p tmp/pids
