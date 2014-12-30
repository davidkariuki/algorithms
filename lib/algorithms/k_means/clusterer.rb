module Algorithms
  module KMeans
    class Clusterer
      MAX_FIXNUM =  (2**(0.size * 8 - 2) - 1)
      MAX_ITERATIONS = 100

      attr_reader :data_points
      attr_accessor :clusters

      def initialize(options)
        raise ArgumentError,  "Please initialize with filename or data points" if options[:data_points].nil? && options[:filename].nil?
        options = defaults.merge(options)
        @num_clusters = options[:num_clusters]
        @filename = options[:filename]
        @data_points = options[:data_points]
        @clusters = options[:clusters]
      end

      def run
        load_data_points if @data_points.nil?
        compute_initial_centroids if clusters.empty?
        MAX_ITERATIONS.times do
          clear_clusters
          assign_points_to_nearest_cluster
          old_clusters = Marshal.load(Marshal.dump(clusters))
          recompute_centroids
          assign_points_to_nearest_cluster
          clusters_did_not_change = old_clusters.zip(clusters).collect {|c1, c2| c1 == c2 }
          break unless clusters_did_not_change.include?(false)
        end
      end

      def to_chart_data
        chart_data = []
        clusters.each_with_index do |cluster, index|
          chart_data += cluster.data_points.map { |dp| [dp.latitude, dp.longitude, index + 1] }
        end
        chart_data
      end

      private

      def assign_points_to_nearest_cluster
        data_points.each do |data_point|
          min_distance, nearest_cluster  = MAX_FIXNUM, nil
          clusters.each do |cluster|
            distance = data_point.geographic_distance(cluster.centroid)
            if distance < min_distance
              nearest_cluster = cluster
              min_distance = distance
            end
          end
          nearest_cluster.add_datapoint(data_point)
        end
      end

      def recompute_centroids
        clusters.each { |cluster| cluster.recompute_centroid! }
      end

      def clear_clusters
        clusters.each { |cluster| cluster.clear! }
      end

      def compute_initial_centroids
        @num_clusters.times do
          centroid = data_points.sample
          clusters << Cluster.new(centroid: centroid)
        end
      end

      def load_data_points
        data_hash = JSON.load(File.open(@filename), nil, symbolize_names: true)
        @data_points = data_hash.collect {|params| Algorithms::KMeans::DataPoint.new(params) }
      end

      def defaults
        { clusters: [], data_points: [], num_clusters: 3 }
      end
    end
  end
end
