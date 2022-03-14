class AddPermissionToRoles < ActiveRecord::Migration[7.0]
  def change
    add_reference :roles, :role_permission, index: true, type: :integer, foreign_key: true
  end
end