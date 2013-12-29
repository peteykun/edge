class Category < ActiveRecord::Base
  has_many :events

  has_attached_file :black_icon, styles: { small: '30x30' },
    storage: :ftp,
    path: '/:class/:attachment/:id_partition/:style/:filename',
    url: 'http://cdn.geekonix.org/:class/:attachment/:id_partition/:style/:filename',
    ftp_servers: [ { host: ENV['FTP_HOST'], user: ENV['FTP_USER'], password: ENV['FTP_PASS'] } ]
    
  has_attached_file :white_icon, styles: { small: '30x30' },
    storage: :ftp,
    path: '/:class/:attachment/:id_partition/:style/:filename',
    url: 'http://cdn.geekonix.org/:class/:attachment/:id_partition/:style/:filename',
    ftp_servers: [ { host: ENV['FTP_HOST'], user: ENV['FTP_USER'], password: ENV['FTP_PASS'] } ]
end
