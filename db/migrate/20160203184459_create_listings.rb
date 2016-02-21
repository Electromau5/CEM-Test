class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
    	t.string :name
    	t.text :description
    	t.string :location
    	t.integer :number
    	t.decimal :price
    	t.string :condition
    	t.timestamps
    end
  end
end
