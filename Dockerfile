FROM ruby:3.0.0

RUN apt-get update -qq && apt-get -y install \
    build-essential \
    libpq-dev \
    vim

RUN mkdir /my_todo_rails
WORKDIR /my_todo_rails
COPY Gemfile /my_todo_rails/Gemfile
COPY Gemfile.lock /my_todo_rails/Gemfile.lock

RUN gem install bundler && bundle install

COPY . /my_todo_rails

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Rails サーバ起動
CMD ["rails", "server", "-b", "0.0.0.0"]
