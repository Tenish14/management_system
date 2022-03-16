class RemoveLocationFromCompany < ActiveRecord::Migration[7.0]
  def change
    remove_reference :companies, :location, index: true, type: :integer, foreign_key: true
  end
end
