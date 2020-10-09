FROM ruby:2.7.0-alpine

RUN apk update && apk add bash build-base git nodejs openssl sqlite-dev tzdata yarn

WORKDIR /home/app

COPY Gemfile* ./

RUN gem install rails bundler

RUN bundler check || bundler install

RUN yarn install --check-files

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

#ENTRYPOINT ["/bin/bash"]