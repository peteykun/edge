class AddAttachmentImageToGalleryPhotos < ActiveRecord::Migration
  def self.up
    change_table :gallery_photos do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :gallery_photos, :image
  end
end
