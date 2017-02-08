class CreateInsuranceConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :insurance_conditions do |t|
      t.integer :insurance_coverage_id, index: true
      t.text :description
      t.timestamps
    end
  end
end
