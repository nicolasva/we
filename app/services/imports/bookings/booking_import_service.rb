module Imports
  module Bookings
    class BookingImportService
      def self.call
        new.execute
      end

      def execute
        @bookings.each do |booking|
          booking = Booking.new(booking.instance_values)
          @errors[booking.name.to_s] = booking.errors.messages unless booking.save
        end

        puts "#### #{@errors.length} Erreur du scrapper Booking ####"
      end

      private
      def initialize
        @errors = {}
        @bookings = Imports::Bookings::BookingService.call
      end
    end
  end
end