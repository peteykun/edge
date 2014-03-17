class AddSubtitleToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :subtitle, :string
  end
end
