class ContactCategory < ActiveRecord::Base
  belongs_to :contact1, class_name: 'Contact', foreign_key: :contact1_id
  belongs_to :contact2, class_name: 'Contact', foreign_key: :contact2_id

  has_many :messages
end
