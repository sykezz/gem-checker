# GemChecker

Checks your gem dependencies using `Gemfile.lock`, and generates a csv file which tells you how outdated your gems versions are.

Initial script was made by @alienxp03, as part of our Gem Tuesdays, to help prioritize which gems to update.

## Installation

Add to your `Gemfile`:

    gem 'gem-checker`
    gem 'gems', github: 'rubygems/gems', branch: 'master'

## Usage

    bundle exec gem_checker

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sykezz/gem-checker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/sykezz/gem-checker/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the GemChecker project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/sykezz/gem-checker/blob/main/CODE_OF_CONDUCT.md).
