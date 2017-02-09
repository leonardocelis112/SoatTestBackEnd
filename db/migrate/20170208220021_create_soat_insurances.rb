# migration for soat insurance
# rubocop:disable MethodLength
class CreateSoatInsurances < ActiveRecord::Migration[5.0]
  def change
    create_table :soat_insurances do |t|
      t.integer :age
      t.integer :number_of_passengers
      t.string :registration_plate
      t.string :cilinder
      t.integer :tons
      t.datetime :acquired_date
      t.datetime :expiration_date
      t.integer :insurance_coverage_id, index: true
      t.integer :user_id
      t.integer :vehicle_class_id, index: true
      t.integer :vehicle_subtype_id, index: true
      t.boolean :paid, default: false
    end
  end
end
