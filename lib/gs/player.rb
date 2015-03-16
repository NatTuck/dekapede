
# This class handles connected players.

class Player
  def initialize(uu)
    @user    = uu
    @token   = uu.token
    @events  = []
    @updates = []
    @char    = uu.characters.first
    @room    = @char.room || @char.world.spawn_room
  end

  def got_move(dir)
    @room, err = @room.try_exit(dir)
    if err != nil
      add_message("There's no exit to the #{dir}")
    else
      add_message("Moved #{dir}")
    end
  end

  def got_command(msg)
    case msg['op']
    when 'move'
      got_move(msg['args'])
    else
      add_message("Unknown command: #{msg['op']}")
    end
 end

  def time_text
    ("%05.1f" % (Time.now.to_f - Date.today.to_time.to_f)).to_s
  end

  def add_message(text)
    @updates << ['message', { time: time_text, text: text }]
  end
  
  def tick!
    @updates << ['main-view', { room_name: @room.name, room_desc: @room.desc }]
  end

  def publish(faye)
    pub = faye.publish("/events/#{@token}", updates: @updates)
    pub.errback do |msg|
      puts "Error: #{msg}"
    end
    
    @updates = []
  end
end
