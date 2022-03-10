class AddRoleToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :role, index: true, type: :integer, foreign_key: true
  end
end
