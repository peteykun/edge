module ApplicationHelper
  def nav_link(link_text, link_path, options = {})
    class_name = current_page?(link_path) ? 'active' : ''

    if !options[:class].nil?
      class_name = class_name + ' ' + options[:class]
    end

    content_tag(:li, class: class_name)  do
      link_to link_text, link_path
    end
  end

  def machinize(human_string)
    human_string.gsub(/( )/, '_').downcase
  end

  def load_time
    sprintf('%.3f', (Time.now.usec - @start_time).abs / 1000000.0)
  end
end
