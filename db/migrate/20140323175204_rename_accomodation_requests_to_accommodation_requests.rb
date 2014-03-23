class RenameAccomodationRequestsToAccommodationRequests < ActiveRecord::Migration
  def change
    rename_table :accomodation_requests, :accommodation_requests
  end
end
