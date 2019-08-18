[![CircleCI](https://circleci.com/gh/belion-freee/bolo.svg?style=svg)](https://circleci.com/gh/belion-freee/bolo)

# Bolo

This is a gem that will provide you to extend function of Ruby class.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bolo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bolo

## Usage

Show you some extensions.
If you want to see all the extensions, see [spec](https://github.com/belion-freee/bolo/blob/master/spec/bolo_spec.rb).

### maps(Enumerable)
An extension of map. You can pass a second argument as an array.

```ruby
["hoge", "foo"].maps(:+, 's') # => ["hoges", "foos"]
[{ hoge: "hoge1", foo: "foo1" }, { hoge: "hoge2", foo: "foo2" }].maps(:[], :hoge) # => ["hoge1", "hoge2"]
```

### integer?
Numeric judgment can be made with character strings.

```ruby
"100".integer? # => true
"hoge".integer? # => false
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/bolo. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Bolo project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/bolo/blob/master/CODE_OF_CONDUCT.md).
