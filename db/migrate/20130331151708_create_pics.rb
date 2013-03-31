class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.string :title
      t.string :photo
      t.string :picable_type
      t.references :picable

      t.timestamps
    end
    add_index :pics, :picable_id
  end
end
