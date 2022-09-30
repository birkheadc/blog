# syntax=docker/dockerfile:1
FROM ruby:3.1.2
WORKDIR /blog
COPY Gemfile /blog/Gemfile
COPY Gemfile.lock /blog/Gemfile.lock
RUN gem install bundler:2.3.7
RUN bundle install
COPY . .

ARG RAILS_BLOG_PASSWORD
ARG RAILS_BLOG_PRODUCTION_DATABASE_PASSWORD
ARG SECRET_KEY_BASE

ENV RAILS_ENV=production
ENV RAILS_BLOG_PASSWORD=${RAILS_BLOG_PASSWORD}
ENV RAILS_BLOG_PRODUCTION_DATABASE_PASSWORD=${RAILS_BLOG_PRODUCTION_DATABASE_PASSWORD}
ENV SECRET_KEY_BASE=${SECRET_KEY_BASE}

# Add a script to be executed every time the container starts.
# COPY wait-for-postgres.sh wait-for-postgres.sh
COPY migrate-and-start.sh migrate-and-start.sh
# RUN chmod +x wait-for-postgres.sh
RUN chmod +x migrate-and-start.sh
# ENTRYPOINT ["/bin/bash", "-c"]
EXPOSE 3000
# CMD ["./wait-for-postgres.sh", "blog-db", "blog", "./migrate-and-start.sh"]

# RUN rake db:migrate

# Configure the main process to run when running the image
# CMD ["rails", "server", "-b", "0.0.0.0"]
