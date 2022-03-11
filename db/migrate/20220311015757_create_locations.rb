class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :address_1
      t.string :address_2
      t.integer :postcode
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
