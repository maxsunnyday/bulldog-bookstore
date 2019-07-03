class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :book, foreign_key: 'isbn_number', primary_key: 'isbn_number'
  belongs_to :order, optional: true

end
