class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :populate_categories

  def populate_categories
    @all_categories = Category.all
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    @start_time = Time.now.usec
  end
end
