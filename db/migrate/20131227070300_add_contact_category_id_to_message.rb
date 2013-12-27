class AddContactCategoryIdToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :contact_category_id, :integer
  end
end
