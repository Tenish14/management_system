class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.integer :phone_number

      t.timestamps
    end
  end
end
