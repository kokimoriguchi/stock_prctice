class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.integer :use_id
      t.integer :product_id

      t.timestamps
    end
  end
end
