class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :populate_categories

  def populate_categories
    @minisites = MiniSite.all
    @all_categories = Category.order(priority: :desc)
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    @start_time = Time.now.usec
    @hits = Net::HTTP.get(URI.parse('http://edge.geekonix.org/counter.php'))
  end
  
  private
    def current_user
      @current_user ||= Participant.find(session[:participant_id]) if session[:participant_id]
    end
    helper_method :current_user
end
