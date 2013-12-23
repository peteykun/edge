class Event < ActiveRecord::Base
  belongs_to :category, class_name: 'Category', foreign_key: :category_id

  has_one :contact1, class_name: 'Contact', foreign_key: :contact1_id
  has_one :contact2, class_name: 'Contact', foreign_key: :contact2_id
end
