class AddItemIdToCarts2 < ActiveRecord::Migration[7.0]
  def change
    add_reference :carts, :item, foreign_key: true
  end
end
