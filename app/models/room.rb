class Room < ActiveRecord::Base
  belongs_to :zone
  delegate :world, to: :zone

  validate :room_fits_in_zone

  def try_exit(dir)
    case dir
    when 'north'
      r1 = zone.room(zz, yy + 1, xx)
    when 'south'
      r1 = zone.room(zz, yy - 1, xx)
    end

    if r1
      return r1, nil
    else
      return self, "No such room"
    end
  end

  private

  def room_fits_in_zone
    if xx < 0 || xx >= zone.size
      errors.add(:xx, "Out of zone.size range")
    end
   
    if yy < 0 || yy >= zone.size
      errors.add(:yy, "Out of zone.size range")
    end
    
    if zz < 0 || zz >= zone.size
      errors.add(:zz, "Out of zone.size range")
    end
  end
end
