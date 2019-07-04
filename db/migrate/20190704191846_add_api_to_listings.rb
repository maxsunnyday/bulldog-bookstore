class AddApiToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :api, :boolean
  end
end
