class Category < ActiveRecord::Base
  has_many :events

  has_attached_file :black_icon, styles: { small: '30x30' }
    
  has_attached_file :white_icon, styles: { small: '30x30' }
end
