class AddNewToEvents < ActiveRecord::Migration
  def change
    add_column :events, :new, :boolean, default: false
  end
end
