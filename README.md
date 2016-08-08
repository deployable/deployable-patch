# Deployable::Patch

The place to store all the monkey patches

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'deployable-patch'
```

And then execute:

    $ bundle

Or install it yourself:

    $ gem install deployable-patch

## Usage

Monkeypatches should be seperated into directories/files based on their classes initially
Then grouped into include files elsewhere for ease of use
The more granular the seperation the more control you have over their use

```ruby
require "deployable/patch/hash/accept"
{:one => 1}.accept(:one)
```

## Contributing

1. Fork it ( https://github.com/deployable/deployable-patch/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
