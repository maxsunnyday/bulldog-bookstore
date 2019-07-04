class ChangeIsbnNumberToBigIntOnListings < ActiveRecord::Migration[5.2]
  def change
    change_column :listings, :isbn_number, :bigint
  end
end
