class Event < ActiveRecord::Base
  belongs_to :category, class_name: 'Category', foreign_key: :category_id

  belongs_to :contact1, class_name: 'Contact', foreign_key: :contact1_id
  belongs_to :contact2, class_name: 'Contact', foreign_key: :contact2_id

  has_attached_file :image, styles: { thumb: '100x100', tile: '375x192#', flagship: '760' },
    storage: :ftp,
    path: '/:class/:attachment/:id_partition/:style/:filename',
    url: 'http://cdn.geekonix.org/:class/:attachment/:id_partition/:style/:filename',
    ftp_servers: [Rails.root.join('config/ftp.yml')]
end
