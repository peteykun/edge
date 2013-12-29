class Contact < ActiveRecord::Base
  has_many :events
  has_many :events

  has_many :contact_categories
  has_many :contact_categories

  def facebook_avatar
    'https://graph.facebook.com/' + facebook_username + '/picture?width=150&height=150'
  end

  def facebook_url
    'http://facebook.com/' + facebook_username
  end
end
