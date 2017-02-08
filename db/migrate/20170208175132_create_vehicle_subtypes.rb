class CreateVehicleSubtypes < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicle_subtypes do |t|
      t.string :name
      t.string :code
      t.decimal :value, precision: 50, scale: 2
      t.decimal :commercial_rate, precision: 10, scale: 2
      t.integer :vehicle_class_id, index: true
    end
  end
end
