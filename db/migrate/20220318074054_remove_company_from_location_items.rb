class RemoveCompanyFromLocationItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :location_items, :company_id
  end
end
