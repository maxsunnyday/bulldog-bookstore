class User < ApplicationRecord
    has_many :listings
    has_many :orders
    has_many :books, through: :listings
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :password, presence: true

    def order_listings
        self.orders.find do |order|
            order.status == "active"
        end.listings
    end
end
