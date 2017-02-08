# Migration for create users table
class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :document_number
      t.string :email
      t.string :document_type
      t.string :telephone
      t.text   :password_digest
      t.timestamps
    end
  end
end
