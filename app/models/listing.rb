class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :book, foreign_key: 'isbn_number', primary_key: 'isbn_number'
  belongs_to :order, optional: true

  validate :valid_isbn_number

  def valid_isbn_number
    if !(self.isbn_number.to_s.length == 13)
      errors.add(:isbn_number, "is not 13 digits")
    end
  end

end
