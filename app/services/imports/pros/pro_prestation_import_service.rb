module Imports
  module Pros
    class ProPrestationImportService
      def self.call
        new.execute
      end

      def execute
        @pro_prestations.each do |pro_prestation|
          pro = Pro.new(pro_prestation.instance_values) 
          @errors[pro.name.to_s] = pro.errors.messages unless pro.save
        end

        puts "#### #{@errors.length} Erreur du scrapper Pro ####"
      end

      private
      def initialize
        @errors = {}
        @pro_prestations = Imports::Pros::ProPrestationService.call
      end
    end
  end
end