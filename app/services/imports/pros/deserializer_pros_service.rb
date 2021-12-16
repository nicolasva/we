module Imports
  module Pros
    class DeserializerProsService
      def initialize(pro)
        @prestation_ids = Array.new
        @openning_hours_attributes = Array.new 
        @appointments_attributes = Array.new
        @name = pro['name']
        @address = pro['address']
        @lat = pro['lat']
        @lng = pro['lng']
        @max_kilometers = pro['max_kilometers']
        pro['prestations'].each do |pro_presta|
          prestation = Prestation.find_by(reference: pro_presta)
          @prestation_ids.push(prestation.id)
        end
        pro['opening_hours'].each do |opening_hour|
          @openning_hours_attributes << { "day": opening_hour['day'], "starts_at": opening_hour['starts_at'], "ends_at": opening_hour['ends_at'] }
        end
        pro['appointments'].each do |appointment|
          @appointments_attributes << { "starts_at": appointment['starts_at'], "ends_at": appointment['ends_at'] }
        end
      end

      attr_accessor :name,
                    :address,
                    :lat,
                    :lng,
                    :max_kilometers,
                    :prestation_ids,
                    :opening_hours_attributes
    end
  end
end
