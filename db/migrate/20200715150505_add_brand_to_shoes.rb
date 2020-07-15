class AddBrandToShoes < ActiveRecord::Migration[5.2]
  def change
    add_reference :shoes, :brand, foreign_key: true
  end
end
