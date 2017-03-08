module ApplicationHelper
  # 
  def nav_link(link_text, link_path)   
    content_tag(:li, class: "#{active_page(link_path)}") do
        link_to link_text, link_path
      end
    end
    
    # 
    def active_page(link_path)
      current_page?(link_path) ? 'active' : nil
    end
  end
