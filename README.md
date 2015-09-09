# IttfPoints

Calculate ITTF rating points.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ittf_points'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ittf_points

## Usage

```ruby
p1 = Player.new(rating_points: 2731, weight: :r2)
p1.win([2122, 1471, 2621]).lose(2788)
# or
# p1.win(2122).win(1471).win(2621).lose(2788)

puts p1.new_rating_points
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hachy/ittf_points.
