# Diabetes Monitor

A simple app to help record and monitor blood sugar and insulin levels over time. Made with [Ruby on Rails](https://rubyonrails.org/).

**Disclaimer**: *This software is a proof-of-concept, and does not provide medical advice. Downloading and/or using this software is entirely at your own risk.*

## Installation

Make sure you have [Ruby](https://www.ruby-lang.org/) 2.7.3 and [Rails](https://rubyonrails.org/) 6.1 installed. You will also need [yarn](https://yarnpkg.com) to use Webpacker, which is needed for the website to run.

Download the source code, then from within the project's root folder run:

```bash
$ bin/bundle install
$ bin/yarn install
```

This will install all dependencies. To create the database run:

```bash
$ bin/rails db:create db:schema:load
```

You will need a Postgresql server running locally for this to work. Finally, to run the app (in the development environment) run:

```bash
$ bin/rails s
```

To receive mail from Devise::Mailer in development, you need to use MailCatcher. Install it using RubyGems and make sure it's running when using mailer features:

```bash
$ gem install mailcatcher
$ mailcatcher
```

## Development

(coming soon)

## Licence

The source code in this repository is licensed under GPLv3-only.
