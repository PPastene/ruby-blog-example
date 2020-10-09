FROM ruby:2.7.0-alpine

RUN apk update && apk add bash build-base git nodejs openssl sqlite-dev tzdata yarn

WORKDIR /app

RUN gem install rails bundler

COPY Gemfile* /app/

RUN bundler check || bundler install

COPY package.json yarn.lock /app/

RUN yarn install --check-files

EXPOSE 3000

#ADD . /app/

#CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

#ENTRYPOINT ["/bin/bash"]