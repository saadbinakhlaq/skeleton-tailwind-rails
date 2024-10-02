FROM ruby:3.3.1

RUN apt-get update \
    && apt-get install -y --no-install-recommends emacs-nox \
    && apt-get install -y curl\
    && curl -sL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install -y nodejs \
    && curl -L https://www.npmjs.com/install.sh | sh \
    && rm -rf /var/lib/apt/lists/*

# for editing credentials with `rails credentials:edit`
ENV EDITOR emacs

WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN bundle install

CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
