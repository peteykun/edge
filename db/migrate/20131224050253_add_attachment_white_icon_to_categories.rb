class AddAttachmentWhiteIconToCategories < ActiveRecord::Migration
  def self.up
    change_table :categories do |t|
      t.attachment :white_icon
    end
  end

  def self.down
    drop_attached_file :categories, :white_icon
  end
end
