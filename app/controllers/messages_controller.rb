class MessagesController < ApplicationController
  def create
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @contact_categories = ContactCategory.all

    @success = @message.save

    if @success
      ContactMailer.contact_mail(@message).deliver
      @message = Message.new
    end
    
    render 'contacts/index'
  end

  private
    def message_params
      params.require(:message).permit(:name, :email, :message, :contact_category_id)
    end
end
