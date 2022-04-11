class RolePermissions < ActiveRecord::Migration[7.0]
  def change
    create_table :role_permission do |t|
      t.belongs_to :role
      t.belongs_to :permission

      t.timestamps
    end
  end
end
 