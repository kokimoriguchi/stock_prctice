class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.string :email
      t.integer :tel
      t.string :information

      t.timestamps
    end
  end
end
