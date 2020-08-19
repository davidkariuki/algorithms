[![Build Status](https://travis-ci.org/davidkariuki/algorithms.svg?branch=master)](https://travis-ci.org/davidkariuki/algorithms)
[![Test Coverage](https://api.codeclimate.com/v1/badges/a99a88d28ad37a79dbf6/test_coverage)](https://codeclimate.com/github/codeclimate/codeclimate/test_coverage)
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
smallest_22 = Algorithms::KthSmallest.new(arr).kth_smallest(22) #returns the 22nd smallest number in arr

# quick_sort! example
Algorithms::QuickSort.new(arr).sort!

# k-means example
clusterer = Algorithms::KMeans::Clusterer.new(filename: 'path-to-file')
clusterer.run
clusterer.to_chart_data #gives clustered data you can throw in a google
visualization (e.g. geochart)
```

## Contributing

1. Fork it ( http://github.com/davidkariuki/algorithms/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
