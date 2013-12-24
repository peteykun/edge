class Contact < ActiveRecord::Base
  has_many :events
  has_many :events

  def facebook_avatar
    'http://graph.facebook.com/' + facebook_username + '/picture?width=150&height=150'
  end

  def facebook_url
    'http://facebook.com/' + facebook_username
  end
end
