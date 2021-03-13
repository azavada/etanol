FROM ruby:3.0-alpine

RUN apk add --update --no-cache git nodejs npm postgresql-client postgresql-dev build-base yarn tzdata py-pip && pip install awscli
WORKDIR /srv/app
#ARG ENV
ARG RAILS_MASTER_KEY
ENV ENV=production
ENV RAILS_ENV=production
ENV PORT=80
ENV RAILS_MASTER_KEY=$RAILS_MASTER_KEY
ENV DATABASE_URL=$DATABASE_URL
COPY . /srv/app
RUN bundle install --jobs=4
RUN yarn install
RUN rails assets:precompile

EXPOSE 80

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]