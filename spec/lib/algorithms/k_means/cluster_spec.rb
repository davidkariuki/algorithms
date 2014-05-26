require 'spec_helper'

describe Algorithms::KMeans::Cluster do

  subject { Algorithms::KMeans::Cluster.new(data_points: [data_point1, data_point2]) }
  let(:data_point1) { Algorithms::KMeans::DataPoint.new(latitude: -23.03, longitude: -77.25) }
  let(:data_point2) { Algorithms::KMeans::DataPoint.new(latitude: -33.03, longitude: -77.25) }
  let(:delta) { 0.00189394 } #10 ft

  describe '#recompute_centroid!' do
    it 'sets the centroid to the geographic center of the cluster (within 10ft)' do
      subject.recompute_centroid!
      new_centroid = subject.centroid
      expect(data_point1.geographic_distance(new_centroid))
        .to be_within(delta)
        .of(data_point2.geographic_distance(new_centroid))
    end
  end

  describe '#clear!' do
    it 'removes all the data points' do
      subject.clear!
      expect(subject.data_points).to be_empty
    end
  end

  describe '#add_datapoint' do
    it 'adds a data point' do
      new_data_point = Algorithms::KMeans::DataPoint.new(latitude: -32.32, longitude: 78.2)
      expect { subject.add_datapoint(new_data_point) }.to change { subject.data_points.size }.by(1)
    end
  end

  describe '#==' do
    it 'returns true if two clusters have the same data points (order is irrelevant)' do
      cluster2 = Algorithms::KMeans::Cluster.new(data_points: [data_point2.dup, data_point1.dup])
      expect(cluster2).to be == subject
    end

  end
end
