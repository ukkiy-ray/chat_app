class RoomsController < ApplicationController
  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_messages_path(@room.id)
    else
      render :new
    end
  end

  private
  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
