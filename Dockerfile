# syntax=docker/dockerfile:1
FROM ruby:3.1.2
RUN apt update && apt install sqlite3
WORKDIR /blog
COPY Gemfile /blog/Gemfile
COPY Gemfile.lock /blog/Gemfile.lock
RUN gem install bundler:2.3.7
RUN bundle install
COPY . .

ARG RAILS_BLOG_PASSWORD
ARG SECRET_KEY_BASE
ENV RAILS_ENV=production
ENV RAILS_BLOG_PASSWORD=${RAILS_BLOG_PASSWORD}
ENV SECRET_KEY_BASE=${SECRET_KEY_BASE}

# Add a script to be executed every time the container starts.
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]

RUN rails db:migrate
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
