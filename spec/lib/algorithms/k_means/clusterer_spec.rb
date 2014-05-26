require 'spec_helper'
require 'json'

describe Algorithms::KMeans::Clusterer do
  let(:filename) { "#{File.dirname(__FILE__)}/../../../fixtures/k_means/data.json" }
  subject { Algorithms::KMeans::Clusterer.new(filename: filename) }
  let(:east_states) { %w(NY NJ PA MA VA) }
  let(:west_states) { %w(CA NV OR WA) }
  let(:fly_over_states) { %w(IA MO NE OK SD) }
  let(:clusters) do
    lat_lngs = [
      { latitude: 37.757717, longitude: -122.410499 }, # San Francisco, CA
      { latitude: 40.764684, longitude: -73.988990 }, # Manhattan, NY
      { latitude: 42.137687, longitude: -100.178348}, # Goose Creek, NE
    ]
    lat_lngs.collect { |ll| Algorithms::KMeans::Cluster.new(centroid: Algorithms::KMeans::DataPoint.new(ll)) }
  end

  describe '#run' do
    context 'with pre-determined clusters' do
      it 'clusters the data into east, west and flyover states' do
        subject.clusters = clusters
        subject.run
        states_by_cluster = subject.clusters.map {|s| s.data_points.classify(&:state).keys.to_set }.to_set
        expect(states_by_cluster).to eq(Set.new([east_states.to_set, west_states.to_set, fly_over_states.to_set]))
      end
    end

    context 'without pre-determined clusters' do
      it 'divides the data into distinct clusters' do
        subject.run
        expect(subject.clusters.map { |cluster| cluster.data_points.size }.inject(:+)).to eq(subject.data_points.to_set.size)
      end
    end
  end

  describe '#to_chart_data' do
    it 'returns an array of data points grouped by cluster' do
      subject.clusters = clusters
      subject.run
      expect(subject.to_chart_data.group_by(&:last).size).to eq(3)
    end
  end

end
