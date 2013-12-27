class ContactsController < ApplicationController
  def index
    @contact_categories = ContactCategory.all
    @message = Message.new
  end
end
