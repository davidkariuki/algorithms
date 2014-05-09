module Algorithms
  class KthSmallest
    class << self

      def smallest(array, k)
        return select(array, k) if (array.length <= 5)
        medians = []
        left,right = [],[]
        array.each_slice(5) do |array_5|
          medians << select(array_5, array_5.length/2)
        end
        m = smallest(medians, medians.length/2)
        array.each { |n| n < m ? left << n : (n > m ? right << n : nil) }
        m_posn = left.length + 1
        if k == m_posn
          m
        elsif k < m_posn
          smallest(left, k)
        else
          smallest(right, k - m_posn)
        end
      end

      private

      def select(array, k)
        array.sort[k - 1]
      end

    end
  end
end
