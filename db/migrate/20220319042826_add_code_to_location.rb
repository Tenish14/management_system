class AddCodeToLocation < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :location_code, :string
  end
end
