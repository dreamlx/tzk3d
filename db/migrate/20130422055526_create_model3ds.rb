class CreateModel3ds < ActiveRecord::Migration
  def change
    create_table :model3ds do |t|
      t.string :title
      t.string :modelfile
      t.integer :product_id
      t.timestamps
    end
  end
end
