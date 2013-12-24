class AddAttachmentBlackIconToCategories < ActiveRecord::Migration
  def self.up
    change_table :categories do |t|
      t.attachment :black_icon
    end
  end

  def self.down
    drop_attached_file :categories, :black_icon
  end
end
