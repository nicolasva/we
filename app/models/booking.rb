class Booking < ApplicationRecord
  has_many :booking_prestations, :validate => false
  has_many :prestations, through: :booking_prestations
  accepts_nested_attributes_for :booking_prestations
  validates :name, :email, presence: true

  geocoded_by :address
  after_validation :geocode
end
