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
end
