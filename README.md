# Detox

[![Build Status](https://secure.travis-ci.org/pinzolo/detox.png)](http://travis-ci.org/pinzolo/detox)
[![Coverage Status](https://coveralls.io/repos/pinzolo/detox/badge.png)](https://coveralls.io/r/pinzolo/detox)

Detox is validator set that can apply to ActiveModel/ActiveRecord

## Installation

Add this line to your application's Gemfile:

    gem 'detox'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install detox

## Usage

- Validators for attribute that has Array or Hash value
  - **ordering**: validates continuous numbers
  - **possession**: validates subset values
  - **all_xxx**: validates that all value are valid, by basic validators (xxx is presence, format etc.)
  - **any_xxx**: validates that has valid value, by basic validators (xxx is presence, format etc.)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
