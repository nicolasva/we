module Imports
  module Pros
    class ProPrestationService
      def self.call
        new.execute
      end

      def execute
        pros = []
        @body['pros'].each do |pro|
          pros << Imports::Pros::DeserializerProsService.new(pro)
        end
        pros
      end

      private

      def initialize
        @response = File.read('lib/json/data.json')
        @body = JSON.parse(@response)
      end
    end
  end
end