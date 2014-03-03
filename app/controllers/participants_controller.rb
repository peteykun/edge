class ParticipantsController < ApplicationController
  before_filter :require_logged_in, only: [:show_current, :edit_current, :update]
  before_filter :require_logged_out, only: [:new, :create]
  before_filter :current_user_or_admin, only: [:show, :edit]

  def show
    @participant = Participant.find(params[:id])

    respond_to do |format|
      format.html
      format.json
      format.svg  { render :qrcode => admin_participant_path(@participant, only_path: false), :level => :l, :unit => 10 }
    end
  end

  def show_current
    @participant = current_user

    render 'show'
  end

  def new
    @participant = Participant.new
  end

  def create
    @participant = Participant.new(participant_params)

    if verify_recaptcha(model: @participant) && (@success = @participant.save)
      session[:participant_id] = @participant.id
      redirect_to profile_path
    else
      render 'edit'
    end
  end

  def edit
    @participant = Participant.find(params[:id])
  end

  def edit_current
    @participant = current_user

    render 'edit'
  end

  def update
    @participant = Participant.find(params[:id])

    @participant.update_attributes(participant_params)
    @success = @participant.save

    render action: 'edit'
  end

  private
    def participant_params
      params.require(:participant).permit(:name, :college, :email, :phone, {:event_ids => []}, :password, :password_confirmation)
    end

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

    def current_user_or_admin
      unless current_admin_user or (not current_user.nil? and current_user.id == params[:id].to_i)
        redirect_to root_path
      end
    end
end
