class RemoveSubtitleFromSponsors < ActiveRecord::Migration
  def change
    remove_column :sponsors, :subtitle, :string
  end
end
