module Imports
  module Bookings
    class DeserializerBookingService
      def initialize(booking)
        @prestation_ids = []
        @email = booking['email']
        @name = booking['name']
        @starts_at = Time.iso8601(booking['starts_at'])
        @address = booking['address']
        @lat  = booking['lat']
        @lng  = booking['lng']
        booking['prestations'].each do |b_prestation|
          @prestation_ids << Prestation.find_by(reference: b_prestation).id
        end
      end

      attr_accessor :prestation_ids,
                    :email,
                    :name,
                    :start_at,
                    :address,
                    :lat,
                    :lng
    end
  end
end
