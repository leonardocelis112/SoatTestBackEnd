# Migration to create vehicles classes
class CreateVehicleClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicle_classes do |t|
      t.string :name
    end
  end
end
