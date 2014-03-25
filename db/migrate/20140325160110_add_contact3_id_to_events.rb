class AddContact3IdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :contact3_id, :integer
  end
end
