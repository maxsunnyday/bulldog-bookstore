class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :isbn_number
      t.string :title
      t.string :author

      t.timestamps
    end
  end
end
