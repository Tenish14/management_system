class DeleteRolePermissionInRole < ActiveRecord::Migration[7.0]
  def change
    remove_column :roles, :role_permission_id
  end
end
