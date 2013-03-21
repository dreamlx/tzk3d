class AddColumnToProduct < ActiveRecord::Migration
  def change
    add_column :products, :model3d, :string
    add_column :products, :desc, :text
    add_column :products, :size, :string
  end
end
