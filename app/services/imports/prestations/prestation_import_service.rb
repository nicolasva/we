module Imports
  module Prestations
    class PrestationImportService
      def self.call
        new.execute
      end

      def execute
        @prestations.each do |prestation|
          prestation = Prestation.new(prestation.instance_values)
          @errors[prestation.reference.to_s] = institution.errors.messages unless prestation.save
        end

        puts "#### #{@errors.length} Erreur du scrapper Prestation ####"
      end

      private
      def initialize
        @errors = {}
        @prestations = Imports::Prestations::PrestationsService.call
      end
    end
  end
end