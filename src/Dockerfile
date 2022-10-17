FROM ruby:3.0.0-alpine

RUN apk add --update --virtual \
  runtime-deps \
  readline \
  build-base \
  yarn \
  file \
  git \
  && rm -rf /var/cache/apk/*

RUN mkdir /usr/src/app
ADD . /usr/src/app/
WORKDIR /usr/src/app/
COPY server.rb .
RUN chmod 0755 /usr/src/app/server.rb

ENV BUNDLE_PATH /gems
RUN yarn install
RUN bundle install

ENTRYPOINT [ "ruby" ]
CMD ["/usr/src/app/server.rb"]
EXPOSE 4040
