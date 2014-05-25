require 'spec_helper'

describe Algorithms::KthSmallest do
  subject { Algorithms::KthSmallest }

  describe '#kth-smallest' do
    let(:array1) { (1..10).to_a.shuffle }
    let(:array2) { (1..1000).collect { rand(1000) }.uniq }

    it 'returns the 3rd smallest number' do
      expect(subject.new(array1).kth_smallest(3)).to eq(3)
    end

    it 'returns the 2nd smallest number' do
      expect(subject.new(array1).kth_smallest(2)).to eq(2)
    end

    it 'returns the 5th smallest number' do
      expect(subject.new(array1).kth_smallest(5)).to eq(5)
    end

    it 'computes the same result as a number obtained by sorting' do
      k = 53
      array2_sorted = array2.sort
      expect(subject.new(array2).kth_smallest(k)).to eq(array2_sorted[k-1])
    end
  end

end

