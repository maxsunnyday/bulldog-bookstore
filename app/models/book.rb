class Book < ApplicationRecord
    has_many :listings, foreign_key: 'isbn_number', primary_key: 'isbn_number'
    has_many :users, through: :listings
    validates :isbn_number, presence: true

    require 'net/http'
    require 'open-uri'
    require 'json'

    def update_from_google
        # get JSON object from Google Books API and parse it
        google_key = Figaro.env.google_key
        uri = URI.parse(URL.concat("/volumes?q=isbn:#{self.isbn_number}&key=#{google_key}"))
        response = Net::HTTP.get_response(uri)
        if response.header.kind_of?(Net::HTTPOK) && JSON.parse(response.body)["totalItems"] != 0
            google_book = JSON.parse(response.body)["items"][0]["volumeInfo"]
            

            # Assign all attributes from found google book
            authors_string = google_book["authors"].map do |author|
                author.concat("; ") #turns array of authors into string separated by semicolons
            end.join("")[0..-3] #removes the last semicolon and space
            
            self.update(
                author: authors_string,
                title: google_book["title"],
                publisher: google_book["publisher"],
                published_date: google_book["publishedDate"],
                description: google_book["description"],
                page_count: google_book["pageCount"],
                average_rating: google_book["averageRating"],
                count_of_ratings: google_book["ratingsCount"],
                imagelink_thumbnail: google_book["imageLinks"]["thumbnail"],
                imagelink_large: google_book["imageLinks"]["large"],
                google_store_link: google_book["infoLink"]
                )
        else
            nil
        end
    end



end
