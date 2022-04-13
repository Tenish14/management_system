class AddColumnInPermission < ActiveRecord::Migration[7.0]
  def change
    add_column :permissions, :path, :string
  end
end
