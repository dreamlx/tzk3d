class CreateProductRelations < ActiveRecord::Migration
  def change
    create_table :product_relations do |t|
      t.string :rs_name
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end
