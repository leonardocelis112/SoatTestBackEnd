# Serializer for Soat Insurance model
class SoatInsuranceSerializer < ActiveModel::Serializer
  attributes :id, :registration_plate, :age, :number_of_passengers, :cilinder,
             :tons, :acquired_date, :expiration_date,
             :paid, :insurance_conditions, :vehicle_details, :payment_id
  has_one :insurance_coverage, serializer: InsuranceCoverageSerializer

  def payment_id
    if object.paid
      object.payment.id
    else
      nil
    end
  end

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
