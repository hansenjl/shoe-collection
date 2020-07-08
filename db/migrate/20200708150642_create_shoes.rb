class CreateShoes < ActiveRecord::Migration[5.1]
  def change
    create_table :shoes do |t|
      t.string :brand
      t.string :color
      t.float :price
      t.boolean :limited_edition

      t.timestamps
    end
  end
end
