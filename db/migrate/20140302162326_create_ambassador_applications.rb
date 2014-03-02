class CreateAmbassadorApplications < ActiveRecord::Migration
  def change
    create_table :ambassador_applications do |t|
      t.integer :participant_id
      t.text :essay

      t.timestamps
    end
  end
end
