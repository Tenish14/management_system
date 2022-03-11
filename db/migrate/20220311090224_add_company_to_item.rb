class AddCompanyToItem < ActiveRecord::Migration[7.0]
  def change
    add_reference :items, :company, index: true, type: :integer, foreign_key: true
  end
end