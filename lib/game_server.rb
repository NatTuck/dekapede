require 'eventmachine'

require 'gs/player'

class GameServer
  def initialize
    @faye = Faye::Client.new("http://localhost:3000/faye")
    @faye.connect

    @sub = @faye.subscribe('/commands') do |msg|
      got_command(msg)
    end

    @players = {}
  end

  def got_command(msg)
    puts msg.inspect

    token = msg['token']

    if msg['op'] == 'connect'
      got_connect(token)
    else
      player = @players[token]
      player.got_command(msg)
      player.publish(@faye)
    end
  end

  def got_connect(token)
    uu = User.find_by_token(token)
    if uu.nil?
      puts "Bad token"
      return
    end

    player = Player.new(uu)
    @players[token] = player
    
    player.tick!
    player.publish(@faye)
  end

  def run!
    EventMachine::PeriodicTimer.new(1) do
      @players.each_value do |player|
        player.tick!
        player.publish(@faye)
      end
    end
  end
end
