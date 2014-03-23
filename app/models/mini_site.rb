class MiniSite < ActiveRecord::Base
  validates :name, :url, presence: true
end
