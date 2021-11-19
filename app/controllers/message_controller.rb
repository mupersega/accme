class MessageController < ApplicationController
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
    @message = Message.new(profile_params)
    @message.seen = false
    @message.save!
    redirect_to root_path
  end

  def update
  end

  def destroy
    @profile.destroy
    redirect_to root_path
  end

  private

  def message_params
    params.require(:message).permit(:sender_id, :receiver_id, :seen, :content)
  end

  def prep_message
    @message = Message.find(params[:id])
  end

  def check_auth
    authorize @message || Message
  end

end
