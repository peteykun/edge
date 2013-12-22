class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :image_url
      t.integer :category_id
      t.integer :contact1_id
      t.integer :contact2_id

      t.timestamps
    end
  end
end
