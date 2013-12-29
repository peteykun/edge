class Sponsor < ActiveRecord::Base
  has_attached_file :logo, styles: { small: '160x65' },
    storage: :ftp,
    path: '/:class/:attachment/:id_partition/:style/:filename',
    url: 'http://cdn.geekonix.org/:class/:attachment/:id_partition/:style/:filename',
    ftp_servers: [ { host: ENV['FTP_HOST'], user: ENV['FTP_USER'], password: ENV['FTP_PASS'], passive: true } ]
end
