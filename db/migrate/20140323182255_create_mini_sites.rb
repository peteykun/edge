class CreateMiniSites < ActiveRecord::Migration
  def change
    create_table :mini_sites do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
