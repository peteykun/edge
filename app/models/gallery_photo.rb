class GalleryPhoto < ActiveRecord::Base
  has_attached_file :image, styles: { square_tile: '180x180#', large: '720' }
end
