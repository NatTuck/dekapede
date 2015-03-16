class Zone < ActiveRecord::Base
  belongs_to :world
  has_many :rooms

  def room(kk, jj, ii)
    Room.where(zz: kk, yy: jj, xx: ii).first
  end
end
