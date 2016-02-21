class CreateListingsPostsJoin < ActiveRecord::Migration
  def change
    create_table :listings_posts, :id => false do |t|
    	t.integer :listing_id
    	t.integer :post_id
    	t.timestamps
    end
  end
end
