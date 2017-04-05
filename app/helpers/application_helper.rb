module ApplicationHelper
  #
  def nav_link(link_text, link_path)
    content_tag(:li, class: active_page(link_path).to_s) do
      link_to link_text, union_path(link_path)
    end
    end

  def dropdown_menu(link_text, link_path)
    content_tag :li do
      link_to link_text, union_path(link_path)
    end
  end

  #
  def active_page(link_path)
    current_page?(link_path) ? 'active' : nil
  end

  def title(text)
    content_for(:title) {text}
  end
  end
