class InsuranceCoverage < ApplicationRecord
  has_many :insurance_conditions
  has_many :soat_insurances
end
