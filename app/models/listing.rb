class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :order, optional: true
end
