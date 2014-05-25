require 'spec_helper'

describe Algorithms::QuickSort do
  subject { Algorithms::QuickSort }

  describe '#sort' do
    let(:ten_element_array) { (1..10).to_a.shuffle }
    let(:single_element_array) { [1] }
    let(:sorted_array) { [1, 2, 3] }
    let(:partially_sorted_array) { [1, 2, 5, 6, 7, 4, 9, 10, 3, 8] }

    it 'simply returns a single-element array wihout calling partition' do
      expect(subject.any_instance).not_to receive(:partition)
      subject.new(single_element_array).sort!
      expect(single_element_array).to eq(single_element_array)
    end

    it 'sorts the array in place' do
      subject.new(ten_element_array).sort!
      expect(ten_element_array).to eq((1..10).to_a)
    end

    it 'sorts a partially sorted array' do
      subject.new(partially_sorted_array).sort!
      expect(partially_sorted_array).to eq((1..10).to_a)
    end

    it 'sorts a fully sorted array' do
      subject.new(sorted_array).sort!
      expect(sorted_array).to eq([1, 2, 3])
    end

    it 'sorts a single element array' do
      subject.new(single_element_array).sort!
      expect(single_element_array).to eq([1])
    end
  end
end
