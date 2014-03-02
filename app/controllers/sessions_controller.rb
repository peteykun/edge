class SessionsController < ApplicationController
  before_filter :require_logged_in, only: [:destroy]
  before_filter :require_logged_out, only: [:new, :create]

  def new
    if current_user
      redirect_to root_url
    end
  end

  def create
    participant = Participant.find_by_email(params[:email])
    if participant && participant.authenticate(params[:password])
      session[:participant_id] = participant.id
      redirect_to profile_path
    else
      @error = 'Invalid e-mail or password.'
      render 'new'
    end
  end

  def destroy
    session[:participant_id] = nil
    redirect_to root_url
  end

  private
    def require_logged_in
      if current_user.nil?
        redirect_to login_path
      end
    end

    def require_logged_out
      if current_user
        redirect_to root_path
      end
    end

    def never
      redirect_to root_path
    end
end
