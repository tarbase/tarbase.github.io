FROM alpine:3.5
MAINTAINER tarbase <hello@tarbase.com>

# Update and install the lastest version of the base packages
RUN apk update && apk upgrade

# Install development packages and dependencies
RUN apk add build-base curl curl-dev wget bash libffi-dev nodejs

# Install ruby and bundler
RUN apk add ruby ruby-dev ruby-bundler

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundler install

RUN mkdir /src
VOLUME ["/src"]
WORKDIR /src
ADD . /src

# Clean APK cache
RUN rm -rf /var/cache/apk/*

# Expose the Jekyll port 4000
EXPOSE 4000

# Run the jekyll serve script
CMD ["./jeklyll-serve.sh"]
