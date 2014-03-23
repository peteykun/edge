class AddNewToMinisites < ActiveRecord::Migration
  def change
    add_column :mini_sites, :new, :boolean
  end
end
