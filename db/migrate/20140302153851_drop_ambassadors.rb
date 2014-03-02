class DropAmbassadors < ActiveRecord::Migration
  def self.up
    drop_table :ambassadors
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
