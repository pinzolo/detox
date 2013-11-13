# Detox

[![Build Status](https://secure.travis-ci.org/pinzolo/detox.png)](http://travis-ci.org/pinzolo/detox)
[![Coverage Status](https://coveralls.io/repos/pinzolo/detox/badge.png)](https://coveralls.io/r/pinzolo/detox)
[![Code Climate](https://codeclimate.com/github/pinzolo/detox.png)](https://codeclimate.com/github/pinzolo/detox)

Detox is validator set that can apply to ActiveModel/ActiveRecord

## Installation

Add this line to your application's Gemfile:

    gem 'detox'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install detox

## Usage

Look [spec/test_class](https://github.com/pinzolo/detox/tree/master/spec/test_class) for sample usage

- Validators for attribute that has Array or Hash value
  - **ordering**: validates continuous numbers
  - **possession**: validates subset values
  - **values_uniqueness**: validates unique values
  - **all_xxx**: validates that all value are valid, by basic validators (xxx is presence, format etc.)
  - **any_xxx**: validates that has valid value, by basic validators (xxx is presence, format etc.)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## Changelog
- v1.0.0 (2013-11-07 JST):  First release
- v1.0.1 (2013-11-13 JST):  Add ValuesUniquenessValidator

