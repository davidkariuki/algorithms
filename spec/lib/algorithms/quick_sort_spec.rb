require 'spec_helper'

describe Algorithms::QuickSort do
  subject { Algorithms::QuickSort }
  context 'sort (in-place)' do

    let(:ten_element_array) { (1..10).to_a.shuffle }
    let(:single_element_array) { [1] }
    let(:sorted_array) { [1, 2, 3] }
    let(:partially_sorted_array) { [1, 2, 5, 6, 7, 4, 9, 10, 3, 8] }

    it 'simply returns a single-element array wihout calling partition' do
      expect(subject).not_to receive(:partition)
      subject.sort!(single_element_array, 0, single_element_array.length - 1)
      expect(single_element_array).to eq(single_element_array)
    end

    it 'sorts the array in place' do
      subject.sort!(ten_element_array, 0, ten_element_array.length - 1)
      expect(ten_element_array).to eq((1..10).to_a)
    end

    it 'sorts a partially sorted array' do
      subject.sort!(partially_sorted_array, 0, partially_sorted_array.length - 1)
      expect(partially_sorted_array).to eq((1..10).to_a)
    end

    it 'sorts a fully sorted array' do
      subject.sort!(sorted_array, 0, sorted_array.length - 1)
      expect(sorted_array).to eq([1, 2, 3])
    end

    it 'sorts a single element array' do
      subject.sort!(single_element_array, 0, single_element_array.length - 1)
      expect(single_element_array).to eq([1])
    end
  end
end
