module ApplicationHelper
  def nav_link_to(*args)
    if args[1] == request.env['PATH_INFO']
      content_tag(:li, class: 'active') do 
        link_to(*args)
      end
    else
      content_tag(:li) do 
        link_to(*args)
      end
    end
  end

  def glyph(name)
    content_tag(:span, class: "glyphicon glyphicon-#{name}", 'aria-hidden': "true") do
    end
  end

  def new_zone_room_path(zone, zz, yy, xx)
    "/zones/#{zone.id}/new_room?zz=#{zz}&yy=#{yy}&xx=#{xx}"
  end
end
