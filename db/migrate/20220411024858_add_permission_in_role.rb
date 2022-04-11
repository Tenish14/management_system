class AddPermissionInRole < ActiveRecord::Migration[7.0]
  def change
    add_column :roles, :permission, :text, array: true, default: []
  end
end
