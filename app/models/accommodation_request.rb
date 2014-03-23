class AccommodationRequest < ActiveRecord::Base
  validates :name, :college, :phone, :from, :to, presence: true
  validates :phone, numericality: { only_integer: true }
end
