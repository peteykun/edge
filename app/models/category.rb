class Category < ActiveRecord::Base
  has_many :events

  has_attached_file :black_icon, styles: { small: '30x30' },
    storage: :ftp,
    path: '/:class/:attachment/:id_partition/:style/:filename',
    url: 'http://cdn.geekonix.org/:class/:attachment/:id_partition/:style/:filename',
    ftp_servers: [Rails.root.join('config/ftp.yml')]
    
  has_attached_file :white_icon, styles: { small: '30x30' },
    storage: :ftp,
    path: '/:class/:attachment/:id_partition/:style/:filename',
    url: 'http://cdn.geekonix.org/:class/:attachment/:id_partition/:style/:filename',
    ftp_servers: [Rails.root.join('config/ftp.yml')]
end
