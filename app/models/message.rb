class Message < ActiveRecord::Base
  validates :name, :email, :message, presence: true
  validates_format_of :email, :with => /@/

  belongs_to :contact_category, class_name: 'ContactCategory', foreign_key: 'contact_category_id'
end
