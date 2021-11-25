class MessagesController < ApplicationController
  before_action :authenticate_user!  

  def new
    @message = Message.new()
  end

  def create
  #   @message = Message.new(profile_params)
  #   @message.seen = false
  #  begin 
  #     @message.save!
  #     redirect_to root_path
  #   rescue
  #     flash.now[:errors] = @message.errors.messages.values.flatten
  #     render 'new'
  #   end
    @message = Message.new(message_params)
    @message.sender = current_user
    @message.receiver_id = Profile.find(params[:id]).user_id
    @message.seen = false
    begin
      @message.save!
      redirect_to root_path
    rescue
      flash.now[:errors] = @message.errors.messages.values.flatten
      render 'new'
    end
   
  end

  def update
    Message.find(params[:id]).update(seen: true)
  end

  def destroy
    Message.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def message_params
    params.require(:message).permit(:sender_id, :receiver_id, :seen, :content, :id)
  end

  def prep_message
    @message = Message.find(params[:id])
  end

end
