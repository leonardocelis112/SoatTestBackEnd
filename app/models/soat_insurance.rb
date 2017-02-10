# class for manage soat insurance
class SoatInsurance < ApplicationRecord
  # Callbacks
  before_create :set_acquired_date
  before_validation :set_coverage

  # Relations
  belongs_to :insurance_coverage
  belongs_to :vehicle_class
  belongs_to :vehicle_subtype
  belongs_to :user
  has_one :payment

  # Scopes
  scope :by_registration_plate, ->(plate) { where(registration_plate: plate) }
  scope :not_outdated, -> { where('expiration_date > ?', Time.zone.now) }

  private

  def set_coverage
    self.insurance_coverage_id = InsuranceCoverage.find_by_code('SOAT2017').id
  end

  def set_acquired_date
    query = SoatInsurance.by_registration_plate(registration_plate).not_outdated
    if query.empty?
      self.acquired_date = Time.zone.now
    else
      self.acquired_date =
        query.order(expiration_date: :desc).first.expiration_date + 1.day
    end
    self.expiration_date = acquired_date + 1.year
  end
end
