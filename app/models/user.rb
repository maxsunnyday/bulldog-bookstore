class User < ApplicationRecord
    has_many :listings
    has_many :orders
    has_many :books, through: :listings
end
