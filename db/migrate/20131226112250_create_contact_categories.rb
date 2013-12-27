class CreateContactCategories < ActiveRecord::Migration
  def change
    create_table :contact_categories do |t|
      t.string :name
      t.integer :contact1_id
      t.integer :contact2_id

      t.timestamps
    end
  end
end
