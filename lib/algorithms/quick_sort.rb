module Algorithms
  class QuickSort
    class << self
      # in-place implementation of the Quicksort Algorithm, source: http://en.wikipedia.org/wiki/Quicksort

      def partition(array, left_index, right_index, pivot_index)
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

      def sort!(array, left_index, right_index)
        if left_index < right_index
          pivot_index = rand(left_index..right_index)
          new_pivot_index = partition(array, left_index, right_index, pivot_index)
          sort!(array, left_index, new_pivot_index - 1)
          sort!(array, new_pivot_index + 1, right_index)
        end
        array
      end

    end
  end
end
