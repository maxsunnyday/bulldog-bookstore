class AddFieldsToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :publisher, :string
    add_column :books, :published_date, :string
    add_column :books, :description, :text
    add_column :books, :page_count, :integer
    add_column :books, :average_rating, :float
    add_column :books, :count_of_ratings, :integer
    add_column :books, :imagelink_thumbnail, :string
    add_column :books, :imagelink_large, :string
    add_column :books, :google_store_link, :string
  end
end
