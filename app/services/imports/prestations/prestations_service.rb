module Imports
  module Prestations
    class PrestationsService
      def self.call
        new.execute
      end

      def execute
        prestations = []
        @body['prestations'].each do |prestation|
          prestations << Imports::Prestations::DeserializerPrestationsService.new(prestation)
        end
        prestations
      end

      private
      def initialize
        @response = File.read('lib/json/data.json')
        @body = JSON.parse(@response)
      end
    end
  end
end