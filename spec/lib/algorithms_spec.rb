require 'spec_helper'

describe Algorithms do

  context 'kth-smallest (median of medians)' do
    let(:array1) { (1..10).to_a.shuffle }
    let(:array2) { (1..1000).collect { rand(1000) }.uniq }

    it 'returns the 3rd smallest number' do
      expect(Algorithms.kth_smallest(array1, 3)).to eq(3)
    end

    it 'returns the 2nd smallest number' do
      expect(Algorithms.kth_smallest(array1, 2)).to eq(2)
    end

    it 'returns the 5th smallest number' do
      expect(Algorithms.kth_smallest(array1, 5)).to eq(5)
    end

    it 'computes the same result as a number obtained by sorting' do
      n = 53
      array2_sorted = array2.sort
      expect(Algorithms.kth_smallest(array2, n)).to eq(array2_sorted[n-1])
    end
  end

  context 'quick_sort (in-place)' do

    let(:ten_element_array) { (1..10).to_a.shuffle }
    let(:single_element_array) { [1] }
    let(:sorted_array) { [1, 2, 3] }
    let(:partially_sorted_array) { [1, 2, 5, 6, 7, 4, 9, 10, 3, 8] }

    it 'sorts the array in place' do
      Algorithms.quick_sort!(ten_element_array, 0, ten_element_array.length - 1)
      expect(ten_element_array).to eq((1..10).to_a)
    end

    it 'sorts a partially sorted array' do
      Algorithms.quick_sort!(partially_sorted_array, 0, partially_sorted_array.length - 1)
      expect(partially_sorted_array).to eq((1..10).to_a)
    end

    it 'sorts a fully sorted array' do
      Algorithms.quick_sort!(sorted_array, 0, sorted_array.length - 1)
      expect(sorted_array).to eq([1, 2, 3])
    end

    it 'sorts a single element array' do
      Algorithms.quick_sort!(single_element_array, 0, single_element_array.length - 1)
      expect(single_element_array).to eq([1])
    end
  end
end

