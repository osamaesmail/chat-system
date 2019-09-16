FROM ruby:2.5.5
RUN apt-get update -qq && apt-get install -y nodejs
RUN mkdir /chat-app
WORKDIR /chat-app
ADD Gemfile Gemfile.lock /chat-app/
ENV BUNDLER_VERSION 2.0.2
RUN gem install bundler && bundle install --jobs 20 --retry 5
ADD . /chat-app

# Add a script to be executed every time the container starts.
ADD entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]