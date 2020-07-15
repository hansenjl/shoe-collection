class RemoveBrandFromShoes < ActiveRecord::Migration[5.2]
  def change
    remove_column :shoes, :brand
  end
end
