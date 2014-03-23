class CreateAccomodationRequests < ActiveRecord::Migration
  def change
    create_table :accomodation_requests do |t|
      t.string :name
      t.string :phone
      t.date :from
      t.date :to

      t.timestamps
    end
  end
end
