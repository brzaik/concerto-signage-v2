module ApplicationHelper
  
  # Generate page titles
  def yield_for_title(content_sym, default)
    output = content_for(content_sym)
    output = "#{ controller.action_name.titleize } - #{ controller.controller_name.titleize }" if output.blank?
    output
  end
  
end
