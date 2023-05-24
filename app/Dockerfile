FROM ruby:3-slim
LABEL maintainer="Micheal Waltz <docker@ecliptik.com>"

#Copy Gemfile for gem install
WORKDIR /app
COPY Gemfile /app

RUN bundle install

#Copy the app after building gems
COPY . /app

#App command
ENTRYPOINT ["bundle"]
CMD ["exec", "rackup", "-o", "0.0.0.0"]
