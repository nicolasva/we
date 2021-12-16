module Imports
  module Prestations
    class DeserializerPrestationsService
      def initialize(prestation)
        @reference = prestation['reference']
        @duration = prestation['duration']
      end

      attr_accessor :reference,
                    :duration
    end
  end
end