class CreateInsuranceCoverages < ActiveRecord::Migration[5.0]
  def change
    create_table :insurance_coverages do |t|
      t.string :code
      t.string :kind
      t.timestamps
    end
  end
end
