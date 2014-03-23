class AccommodationRequestsController < ApplicationController
  def new
    @accommodation_request = AccommodationRequest.new

    unless current_user.nil?
      @accommodation_request.name = current_user.name
      @accommodation_request.phone = current_user.phone
      @accommodation_request.college = current_user.college
    end

    @accommodation_request.from = Date.new(2014, 4, 4)
    @accommodation_request.to = Date.new(2014, 4, 6)
  end

  def create
    @accommodation_request = AccommodationRequest.new(accommodation_request_params)

    if current_user or verify_recaptcha(model: @accommodation_request)
      @success = @accommodation_request.save
    end

    @accommodation_request = AccommodationRequest.new if @success

    render 'new'
  end

  private
    def accommodation_request_params
      params.require(:accommodation_request).permit(:name, :college, :phone, :from, :to)
    end
end
