class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :category, class_name: 'Category', foreign_key: :category_id

  belongs_to :contact1, class_name: 'Contact', foreign_key: :contact1_id
  belongs_to :contact2, class_name: 'Contact', foreign_key: :contact2_id
  belongs_to :sponsor

  has_and_belongs_to_many :participants
  

  has_attached_file :image, styles: { thumb: '100x100', tile: '375x192#', flagship: '760' },
    storage: :ftp,
    path: '/:class/:attachment/:id_partition/:style/:filename',
    url: 'http://cdn.geekonix.org/:class/:attachment/:id_partition/:style/:filename',
    ftp_servers: [ { host: ENV['FTP_HOST'], user: ENV['FTP_USER'], password: ENV['FTP_PASS'], passive: true } ]
end
