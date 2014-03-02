class AmbassadorApplication < ActiveRecord::Base
  belongs_to :participant
  validates_presence_of :essay
end
