# RangeArray

This is a very simple subclass of the `Array` class, aimed specifically at supporting `Ranges`, rather than general objects.

When a new range is added to the array (using the `<<` method), the RangeArray ensures that there are no overlapping ranges, and if necessary, merges any overlapping ranges into a single range.

For example, if the RangeArray holds the ranges (1..10) and (20..30), appending the range (5..25) will merge all ranges into a single range (1..30).

At this stage, only the `<<` has been overridden, so no other methods are checked to guard against non-range members.

## Installation

Add this line to your application's Gemfile:

    gem 'range_array'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install range_array

## Usage

In your `Gemfile`:

```gem range_array```

Simple example:

    require 'range_array'
    ra = RangeArray.new
    ra << (1..10)  # [(1..10)]
    ra << (20..30) # [(1..10), (20..30)]
    ra << (5..25)  # [(1..30)]

Also works for dates:

    require 'range_array'
    require 'date'
    ra = RangeArray.new
    ra << (Date.parse('2013-01-01') .. Date.parse('2013-05-01'))
    ra << (Date.parse('2013-10-01') .. Date.parse('2013-12-31'))
    ra << (Date.parse('2013-04-01') .. Date.parse('2013-11-01')) # [('2013-01-01' .. '2013-12-31')]

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
