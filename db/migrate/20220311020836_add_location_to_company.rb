class AddLocationToCompany < ActiveRecord::Migration[7.0]
  def change
    add_reference :companies, :location, index: true, type: :integer, foreign_key: true
  end
end
