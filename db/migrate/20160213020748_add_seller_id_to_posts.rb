class AddSellerIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :seller_id, :integer
  end
end
