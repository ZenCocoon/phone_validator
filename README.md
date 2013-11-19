# Phone Validator

[![build status](https://secure.travis-ci.org/ZenCocoon/phone_validator.png)](http://travis-ci.org/ZenCocoon/phone_validator)

[phone_validator](https://github.com/ZenCocoon/phone_validator) makes phone validation natural for ActiveModel 3+ objects.
The validation is using the excellent [global_phone](https://github.com/sstephenson/global_phone)

## Requirements

```
activemodel >= 3.0.0
global_phone >= 1.0.1
```

## Usage

Install [global_phone](https://github.com/sstephenson/global_phone)

Add to your Gemfile:

```ruby
gem 'phone_validator'
```

Run:

```
bundle install
```

Then add the following to your model:

```ruby
validates :my_phone_attribute, :phone => true
```

## License

MIT License. Copyright 2013 Sébastien Grosjean, sponsored by [BookingSync, Vacation Rental's Booking Calendar Software](http://www.bookingsync.com)
