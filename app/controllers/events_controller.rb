class EventsController < ApplicationController
  def index
  end

  def show
    @event = Event.friendly.find(params[:id])
  end
end
