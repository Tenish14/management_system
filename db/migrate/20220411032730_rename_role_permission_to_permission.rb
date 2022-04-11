class RenameRolePermissionToPermission < ActiveRecord::Migration[7.0]
  def change
    rename_table :role_permissions, :permission
  end
end
