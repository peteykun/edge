class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name
      t.string :college
      t.string :email
      t.string :phone

      t.timestamps
    end

    create_table :events_participants do |t|
      t.string :event_id
      t.string :participant_id

      t.timestamps
    end
  end
end
