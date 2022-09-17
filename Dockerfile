FROM ruby:2.7.1-alpine3.12

LABEL maintainer="Robert Gauld <robert@robertgauld.uk>"

# Create and switch to user called app
RUN adduser -D app
WORKDIR /home/app

# Copy over app and install dependencies
COPY app/Gemfile app/Gemfile.lock /home/app/
RUN cd /home/app && bundle update --bundler && bundle install

# Copy rest of app
COPY app /home/app
RUN chown -R app:app /home/app && chmod -R u+w /home/app


CMD bundle exec run
