module PagesHelper

  def auto_pages
    html = ""
    Page.tree.each_key do |key|
      html << "<li class='plegate li_menu'>"
      html << "<a href='/pages/" + Page.tree[key].id.to_s + "'>" + Page.tree[key].title + "</a>"
      html << recursive_childs(Page.tree[key]["hijos"].rehash)
      html << "</li>"
    end
    return html.html_safe
  end

end
