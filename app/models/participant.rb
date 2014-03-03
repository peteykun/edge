class Participant < ActiveRecord::Base
  has_and_belongs_to_many :events
  has_one :ambassador_application

  accepts_nested_attributes_for :events

  validates :name, :college, :email, :phone, presence: true
  validates :email, :phone, uniqueness: true
  validates :phone, numericality: { only_integer: true }
  validates :password, length: { minimum: 6 }, if: :password
  validate  :participation_in_at_least_one_event
  validates_format_of :email, :with => /@/
  before_validation :downcase_email

  has_secure_password

  def participation_in_at_least_one_event
    if self.events.size < 1
      errors[:base] << "Must take part in at least one event."
    end
  end

  def downcase_email
    email.downcase!
  end
end
