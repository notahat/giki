# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def delete_button
    image_tag("cross.png", :size => "16x16", :alt => "delete", :class => "icon")
  end
  
end
