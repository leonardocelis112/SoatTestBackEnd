# Migration for history table payments
class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :user_id, index: true
      t.integer :soat_insurance_id, index: true
      t.decimal :value, precision: 50, scale: 2
      t.decimal :contribution, precision: 50, scale: 2
      t.decimal :total, precision: 50, scale: 2
      t.string :card_number
      t.timestamps
    end
  end
end
