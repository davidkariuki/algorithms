module Algorithms
  class << self
    # in-place implementation of the Quicksort Algorithm, source: http://en.wikipedia.org/wiki/Quicksort

    # left is the index of the leftmost element of the subarray
    # right is the index of the rightmost element of the subarray (inclusive)
    # number of elements in subarray = right-left + 1
    def partition(array, left, right, pivot_index)
      pivot = array[pivot_index]
      array[pivot_index], array[right] = array[right], array[pivot_index]
      moving_index = left
      (left..right - 1).each do |i|
        if array[i] <= pivot
          array[i], array[moving_index] = array[moving_index], array[i]
          moving_index += 1
        end
      end
      array[moving_index], array[right] = array[right], array[moving_index]
      moving_index
    end

    def quick_sort!(array, left, right)
      if left < right
        pivot_index = left + (right-left)/2
        new_pivot_index = partition(array, left, right, pivot_index)
        quick_sort!(array, left, new_pivot_index - 1)
        quick_sort!(array, new_pivot_index + 1, right)
      end
      array
    end

  end
end
