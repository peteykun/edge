class AddCollegeToAccomodationRequests < ActiveRecord::Migration
  def change
    add_column :accomodation_requests, :college, :string
  end
end
