class AddAdminToSellers < ActiveRecord::Migration
  def change
  	add_column :sellers, :admin, :boolean, default: false
  end
end
