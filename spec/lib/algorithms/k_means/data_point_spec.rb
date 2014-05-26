require 'spec_helper'

describe Algorithms::KMeans::DataPoint do

  subject { Algorithms::KMeans::DataPoint }
  let(:args) { { latitude: -23.03, longitude: -77.25 } }
  let(:args2) { { latitude: -33.03, longitude: -77.25 } }

  context '#initialize' do
    it 'raises an error if initialized without latitude or longitude' do
      expect { subject.new(foo: 'bar') }.to raise_error(ArgumentError)
    end

    it 'does not raise an error if initialized with latitude and longitude' do
      expect { subject.new(args) }.not_to raise_error
    end
  end

  context '#geographic_distance' do
    it 'calculates the geographic distance between the same datapoint as zero' do
      expect(subject.new(args).geographic_distance(subject.new(args))).to eq(0)
    end

    it 'calculates the geographic distance between two datapoints' do
      expect(subject.new(args).geographic_distance(subject.new(args2))).to be > 500
    end
  end

  context 'external dependencies' do
    it 'implements geocoder methods' do
      expect(subject.new(args)).to respond_to(:to_coordinates)
    end

    it 'implements set comparison methods' do
      expect(subject.new(args)).to respond_to(:eql?, :hash)
    end
  end

end
