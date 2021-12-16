class Pro < ApplicationRecord
  has_many :pro_prestations
  has_many :prestations, through: :pro_prestations
  has_many :openning_hours
  has_many :appointments
  validates_uniqueness_of :name
  accepts_nested_attributes_for :openning_hours, :appointments
  validates_uniqueness_of :name

  scope :find_skills, ->(booking) { ProsQuery.new.find_skills(booking) }
  scope :find_openning, -> (booking) {
    joins(:openning_hours)
      .where(openning_hours: { day: booking.starts_at.strftime('%A').downcase })
      .where("strftime('%H:%M' ,openning_hours.starts_at) <= :date
      and strftime('%H:%M' ,openning_hours.ends_at) >= :date", { date: booking.starts_at.strftime('%H:%M') })
  }
  scope :find_not_appointment, -> (booking) {
    left_joins(:appointments)
      .where('appointments.starts_at > :starts_at and
      appointments.ends_at < :starts_at', { starts_at: booking.starts_at })
  }
  scope :opening_and_not_appointment, ->(booking) { find_openning(booking).find_not_appointment(booking) }
  scope :find_all_conditions, -> (booking) { opening_and_not_appointment(booking).find_skills(booking) }

  def self.find_distance(pros, booking)
    pros.find_all { |pro| Geocoder::Calculations.distance_between(booking, pro) < pro.max_kilometers }
  end

  def self.find_all(booking)
    pros = Pro.find_all(booking)
    Pro.find_distance(pros, booking)
  end

  geocoded_by :address
  after_validation :geocode
end