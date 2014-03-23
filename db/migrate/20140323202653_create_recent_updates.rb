class CreateRecentUpdates < ActiveRecord::Migration
  def change
    create_table :recent_updates do |t|
      t.string :body

      t.timestamps
    end
  end
end
