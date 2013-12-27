class ContactsController < ApplicationController
  def index
    @contact_categories = ContactCategory.all
  end
end
