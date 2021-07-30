class ChatroomController < ApplicationController

  before_action :require_user

  def index
    @chatrooms = Chatroom.all
  end

  def create
    if !Chatroom.check_db(params[:name]).present? && !Chatroom.check_db(current_user.username).present?
      @chatroom = Chatroom.new(name: params[:name], sender: current_user.username)
      @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      redirect_to chatroom_path(Chatroom.check_db(params[:name]).id)
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @messages = @chatroom.messages.custom_display
    @message = Message.new
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end

end