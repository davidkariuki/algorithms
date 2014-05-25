module Algorithms
  class QuickSort
    # in-place implementation of the Quicksort Algorithm, source: http://en.wikipedia.org/wiki/Quicksort
    attr_reader :array

    def initialize(array)
      @array = array
    end

    def sort!(left_index = 0, right_index = array.size - 1)
      if left_index < right_index
        pivot_index = rand(left_index..right_index)
        new_pivot_index = partition(left_index, right_index, pivot_index)
        sort!(left_index, new_pivot_index - 1)
        sort!(new_pivot_index + 1, right_index)
      end
      array
    end

    private

    def partition(left_index, right_index, pivot_index)
      pivot = array[pivot_index]
      array[pivot_index], array[right_index] = array[right_index], array[pivot_index]
      new_pivot_index = left_index
      (left_index..right_index - 1).each do |i|
        if array[i] <= pivot
          array[i], array[new_pivot_index] = array[new_pivot_index], array[i]
          new_pivot_index += 1
        end
      end
      array[new_pivot_index], array[right_index] = array[right_index], array[new_pivot_index]
      new_pivot_index
    end

  end
end
