module Algorithms
  class << self

    def kth_smallest(array, k)
      return select(array, k) if (array.length <= 5)
      medians = []
      left,right = [],[]
      array.each_slice(5) do |array_5|
        medians << select(array_5, array_5.length/2)
      end
      pivot = kth_smallest(medians, medians.length/2)
      array.each { |n| n < pivot ? left << n : (n > pivot ? right << n : nil) }
      pivot_rank = left.length + 1
      if k == pivot_rank
        pivot
      elsif k < pivot_rank
        kth_smallest(left, k)
      else
        kth_smallest(right, k - pivot_rank)
      end
    end

    private

    def select(array, k)
      array.sort[k - 1]
    end
  end

end
