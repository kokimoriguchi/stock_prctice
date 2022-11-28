class CreateBuyItems < ActiveRecord::Migration[7.0]
  def change
    create_table :buy_items do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :item_num

      t.timestamps
    end
  end
end
