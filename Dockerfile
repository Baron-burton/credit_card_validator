FROM ruby:2.5.5

RUN apt-get update -qq && apt-get install -y nodejs

RUN mkdir /app
WORKDIR /app

RUN gem update --system
RUN gem install bundler

COPY Gemfile Gemfile.lock /app/
RUN bundle install

COPY . /app

CMD rails server -b 0.0.0.0
