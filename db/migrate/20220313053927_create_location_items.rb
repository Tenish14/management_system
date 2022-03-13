class CreateLocationItems < ActiveRecord::Migration[7.0]
  def change
    create_table :location_items do |t|
      t.belongs_to :company
      t.belongs_to :location
      t.belongs_to :item

      t.timestamps
    end
  end
end
