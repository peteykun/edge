class AddSponsorIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :sponsor_id, :integer
  end
end
