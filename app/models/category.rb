class Category < ActiveRecord::Base
  has_many :events

  has_attached_file :black_icon, styles: { small: '30x30' },
    storage: :dropbox,
    dropbox_credentials: Rails.root.join('config/dropbox.yml'),
    path: ':class/:attachment/:id_partition/:style/:filename'
    
  has_attached_file :white_icon, styles: { small: '30x30' },
    storage: :dropbox,
    dropbox_credentials: Rails.root.join('config/dropbox.yml'),
    path: ':class/:attachment/:id_partition/:style/:filename'
end
