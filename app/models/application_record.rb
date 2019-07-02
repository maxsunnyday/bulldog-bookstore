class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  
  URL = "https://www.googleapis.com/books/v1"

end