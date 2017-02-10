FROM ruby:2.3.3

RUN apt-get update -qq && \
  apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /usr/src/app

WORKDIR /usr/src/app

ADD Gemfile /usr/src/app
ADD Gemfile.lock /usr/src/app
RUN bundle install
ADD . /usr/src/app

RUN rails db:migrate
RUN rails db:setup

EXPOSE 8082

# In case a container is restarted, remove existing pid and start server
CMD bash -c "rm -f tmp/pids/server.pid && bundle exec rails s -p 8082 -b '0.0.0.0'"
