class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :order, optional: true

require 'net/http'
require 'open-uri'
require 'json'

  def search_for_book(query)
    google_key = Figaro.env.google_key
    uri = URI.parse(URL.concat("/volumes?q=#{query}&key=#{google_key}"))
    response = Net::HTTP.get_response(uri)
    response.body
    
  end


end
