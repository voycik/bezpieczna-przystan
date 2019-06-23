# Bezpieczna Przystań

[![Build Status](https://travis-ci.com/bezpieczna-przystan/bezpieczna-przystan.svg?branch=master)](https://travis-ci.com/bezpieczna-przystan/bezpieczna-przystan)

## App description

This app is made as a homepage for temporary home for pets. It provides content menagement, like articles and each pet card. People who are interested in adoption can contact via built in forms.
Pets and articles can be shared on social networks directly from app.

## Preview

http://www.bezpieczna.przystan.pl

## Technology stack

|                     Name                     | Version |
| :------------------------------------------: | :-----: |
|      [Ruby](https://www.ruby-lang.org)       |  2.6.1  |
| [Ruby on Rails](http://www.rubyonrails.org/) |  5.2.2  |
|   [PostgreSQL](http://www.postgresql.org/)   |  11.1   |

## Setup

- Configuration
  `bundle install`

- Database creation
  `rails db:setup`

- Running rails server
  `rails s`

* ...
## Creating admin account

- Open rails console
- Type User.create(email: '<email here>', password: 'enter your password here')
- Now you can log in on /admin
