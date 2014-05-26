module Algorithms
  module KMeans
    class DataPoint
      attr_reader :latitude, :longitude, :state

      def initialize(options)
        raise ArgumentError,  "Please initialize with :latitude, :longitude" if options[:latitude].nil? || options[:longitude].nil?
        @latitude = options[:latitude].to_f
        @longitude = options[:longitude].to_f
        @state = options[:state]
      end

      def geographic_distance(business)
        Geocoder::Calculations.distance_between(self, business)
      end

      # Geocoder dependency
      def to_coordinates
        [latitude, longitude]
      end

      # Set equality dependencies
      def eql?(other_object)
        latitude == other_object.latitude && longitude == other_object.longitude
      end

      def hash
        [latitude, longitude].hash
      end

    end
  end
end
