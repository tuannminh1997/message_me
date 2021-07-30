class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(message_params)
    # message = current_user.messages.new(body: params[:body], chatroom_id: params[:chatroom_id])
    if message.save
      ActionCable.server.broadcast(
        "chatroom_channel_#{params[:message][:chatroom_id]}",
        { mod_message: message_render(message) }
      )
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :chatroom_id)
  end

  def message_render(message)
    render(partial: 'message', locals: {message: message})
  end

end
