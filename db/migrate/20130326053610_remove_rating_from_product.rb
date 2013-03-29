class RemoveRatingFromProduct < ActiveRecord::Migration
  def up
    remove_column :products, :rating
  end

  def down
  end
end
