class World < ActiveRecord::Base
  has_many :zones
  
  def spawn_room
    Room.find_by_id(spawn_room_id)
  end
end
