class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :facebook_username
      t.string :phone

      t.timestamps
    end
  end
end
