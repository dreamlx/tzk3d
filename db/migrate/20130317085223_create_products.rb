class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :designer
      t.integer :rating
      t.decimal :price
      t.string :photo

      t.timestamps
    end
  end
end
