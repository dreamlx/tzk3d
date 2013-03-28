class AddFavorToProduct < ActiveRecord::Migration
  def change
    add_column :products, :favor, :boolean, :default=> false
  end
end
