class RemoveNumberFromListings < ActiveRecord::Migration
  def change
  	remove_column :listings, :number
  end
end
