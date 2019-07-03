class Order < ApplicationRecord
  belongs_to :user
  has_many :listings

  # def convert_time(datetime)
  #   time = Time.parse(datetime).in_time_zone("Eastern Time (US & Canada)")
  #   time.strftime("%-d/%-m/%y: %H:%M %Z")
  # end
end
