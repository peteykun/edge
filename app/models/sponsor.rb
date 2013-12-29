class Sponsor < ActiveRecord::Base
  has_attached_file :logo, styles: { small: '160x65' },
    storage: :ftp,
    path: '/:class/:attachment/:id_partition/:style/:filename',
    url: 'http://cdn.geekonix.org/:class/:attachment/:id_partition/:style/:filename',
    ftp_servers: [Rails.root.join('config/ftp.yml')]
end
