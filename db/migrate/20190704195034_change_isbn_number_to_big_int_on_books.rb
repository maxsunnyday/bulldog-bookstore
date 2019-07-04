class ChangeIsbnNumberToBigIntOnBooks < ActiveRecord::Migration[5.2]
  def change
    change_column :books, :isbn_number, :bigint
  end
end
