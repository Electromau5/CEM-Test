class CreateSeller < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
    	t.string :sellername
    	t.string :email
    	t.string :location
    	t.string :site
    	t.timestamps
    end
  end
end
