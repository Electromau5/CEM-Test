class AddPasswordDigestToSellers < ActiveRecord::Migration
  def change
  	add_column :sellers, :password_digest, :string
  end
end
