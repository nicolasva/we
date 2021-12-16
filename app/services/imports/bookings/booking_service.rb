module Imports
  module Bookings
    class BookingService
      def self.call
        new.execute
      end

      def execute
        bookings = []
        @body['bookings'].each do |booking|
          bookings << Imports::Bookings::DeserializerBookingService.new(booking)
        end
        bookings
      end

      private
      def initialize
        @response = File.read('lib/json/data.json')
        @body = JSON.parse(@response)
      end
    end
  end
end
