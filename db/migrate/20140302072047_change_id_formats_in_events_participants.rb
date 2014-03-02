class ChangeIdFormatsInEventsParticipants < ActiveRecord::Migration
  def self.up
    execute 'ALTER TABLE events_participants ALTER COLUMN event_id TYPE integer USING (event_id::integer)'
    execute 'ALTER TABLE events_participants ALTER COLUMN participant_id TYPE integer USING (participant_id::integer)'
  end

  def self.down
   change_column :events_participants, :event_id, :string
   change_column :events_participants, :participant_id, :string
  end
end
