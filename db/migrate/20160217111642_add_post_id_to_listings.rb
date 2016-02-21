class AddPostIdToListings < ActiveRecord::Migration
  def change
    add_column :listings, :post_id, :integer
  end
end
