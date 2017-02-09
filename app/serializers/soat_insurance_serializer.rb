# Serializer for Soat Insurance model
class SoatInsuranceSerializer < ActiveModel::Serializer
  attributes :id, :registration_plate, :age, :number_of_passengers, :cilinder,
             :tons, :acquired_date, :expiration_date,
             :paid, :insurance_conditions, :vehicle_details
  has_one :insurance_coverage, serializer: InsuranceCoverageSerializer

  def insurance_conditions
    conditions = []
    object.insurance_coverage.insurance_conditions.each do |condition|
      conditions << condition.description
    end
    conditions
  end

  def vehicle_details
    object.vehicle_class.name
  end
end
