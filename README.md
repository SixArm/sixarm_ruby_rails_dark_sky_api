# SixArm.com → Ruby → Rails → <br> Dark Sky API gem

<!--header-open-->

[![Gem Version](https://badge.fury.io/rb/sixarm_ruby_rails_dark_sky_api.svg)](http://badge.fury.io/rb/sixarm_ruby_rails_dark_sky_api)
[![Build Status](https://travis-ci.org/SixArm/sixarm_ruby_rails_dark_sky_api.png)](https://travis-ci.org/SixArm/sixarm_ruby_rails_dark_sky_api)
[![Code Climate](https://api.codeclimate.com/v1/badges/162f0f19afdb800182e0/maintainability)](https://codeclimate.com/github/SixArm/sixarm_ruby_rails_dark_sky_api/maintainability)

* Git: <https://github.com/SixArm/sixarm_ruby_rails_dark_sky_api>
* Doc: <http://sixarm.com/sixarm_ruby_rails_dark_sky_api/doc>
* Gem: <https://rubygems.org/gems/sixarm_ruby_rails_dark_sky_api>
* Contact: Joel Parker Henderson, <joel@sixarm.com>
* Project: [changes](CHANGES.md), [license](LICENSE.md), [contributing](CONTRIBUTING.md).

<!--header-shut-->

## Introduction

Use the Dark Sky API to get weather forecasts.


<!--install-open-->

## Install

### Gem

To install this gem in your shell or terminal:

    gem install sixarm_ruby_rails_dark_sky_api

### Gemfile

To add this gem to your Gemfile:

    gem 'sixarm_ruby_rails_dark_sky_api'

### Require

To require the gem in your code:

    require 'sixarm_ruby_rails_dark_sky_api'

<!--install-shut-->


## Examples

Get a weather forecast for a given location:

   DarkSky::API::get(latitude: 37.8267, longitude: -122.4233)
   #=> Use Faraday to do a web request

Construct a URI:

   DarkSky::API::uri(latitude: 37.8267, longitude: -122.4233)
   #=> "https://api.darksky.com/e7229b15122c03b36cbed5cb8897e593/37.8267,-122.4233"

Get a secret key:

   DarkSky::API::secret_key
   #=> "e7229b15122c03b36cbed5cb8897e593"

Get the Rails credentials for the current Rails environment:

   DarkSky::API::credentials
   #=> {:secret_key=>"e7229b15122c03b36cbed5cb8897e593"}


## Credentials

Put your own Dark Sky API key in your Rails credentials file:

    env:
      development:
        dark_sky:
          api:
            secret_key: e7229b15122c03b36cbed5cb8897e593
      test:
        dark_sky:
          api:
            secret_key: e7229b15122c03b36cbed5cb8897e593
      production:
        dark_sky:
          api:
            secret_key: e7229b15122c03b36cbed5cb8897e593

You can use different secret keys for different environments.

You can customize the credentials by overriding the method DarkSky::API::credentials and/or DarkSky::API::secret_key
