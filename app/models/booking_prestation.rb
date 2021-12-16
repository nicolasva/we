class BookingPrestation < ApplicationRecord
  belongs_to :booking
  belongs_to :prestation
  accepts_nested_attributes_for :prestation
  validates :prestation_id, presence: true, allow_nil: true
end
