class AddListingIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :listing_id, :integer
  end
end
