class CreateRolePermissions < ActiveRecord::Migration[7.0]
  def change
    create_table :role_permissions do |t|
      t.string :authority

      t.timestamps
    end
  end
end
