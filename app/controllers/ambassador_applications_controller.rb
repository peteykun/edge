class AmbassadorApplicationsController < ApplicationController
  before_filter :require_logged_in
  
  def new
    @not_applied = current_user.ambassador_application.nil?

    if @not_applied
      @application = AmbassadorApplication.new
      @application.participant = current_user
    end
  end

  def create
    @application = AmbassadorApplication.new(ambassador_application_params)

    if verify_recaptcha(model: @participant)
      @application.save
    end

    redirect_to new_ambassador_application_path
  end

  private
    def ambassador_application_params
      params.require(:ambassador_application).permit(:participant_id, :essay)
    end

    def require_logged_in
      if current_user.nil?
        redirect_to login_path
      end
    end
end
