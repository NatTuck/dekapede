class Character < ActiveRecord::Base
  belongs_to :user

  def room
    Room.find_by_id(room_id)
  end

  def world
    World.find(world_id)
  end
end
