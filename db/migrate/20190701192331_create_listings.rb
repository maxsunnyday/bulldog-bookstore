class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.float :price
      t.belongs_to :user, foreign_key: true
      t.integer :isbn_number, foreign_key: true
      t.belongs_to :order, foreign_key: true

      t.timestamps
    end
  end
end
