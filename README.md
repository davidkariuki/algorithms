[![Build Status](https://travis-ci.org/davidkariuki/algorithms.svg?branch=master)](https://travis-ci.org/davidkariuki/algorithms)
[![Code
Climate](https://codeclimate.com/github/davidkariuki/algorithms.png)](https://codeclimate.com/github/davidkariuki/algorithms)
[![Code
Climate](https://codeclimate.com/github/davidkariuki/algorithms/coverage.png)](https://codeclimate.com/github/davidkariuki/algorithms)
# Algorithms

Collection of different algorithms, in ruby.

## Installation

Add this line to your application's Gemfile:

    gem 'algorithms', github: 'davidkariuki/algorithms'

And then execute:

    $ bundle

## Usage

```ruby
# kth_smallest example
arr = (1..100).shuffle
Algorithms.kth_smallest(arr, 22) #returns the 22nd smallest number in arr
```

## Contributing

1. Fork it ( http://github.com/davidkariuki/algorithms/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
