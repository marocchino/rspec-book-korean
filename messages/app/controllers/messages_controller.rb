class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    if message.save
      flash[:notice] = "The message was saved successfully"
      redirect_to action: :index
    else
      @message = message
      render :new
    end

  end

  private
  def message_params
    params[:message].permit(:text)
  end
end
