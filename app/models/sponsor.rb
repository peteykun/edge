class Sponsor < ActiveRecord::Base
  has_attached_file :logo, styles: { small: '160x65' }
end
