class ApplicationController < ActionController::Base
  protect_from_forgery


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
  helper_method :auto_pages
  def recursive_childs newtree={}
    newhtml = "<ul>"
    newtree.each_key do |key|
      newhtml << "<li class='plegate'>"
      newhtml << "<a href='/pages/" + newtree[key].id.to_s + "'>" + newtree[key].title + "</a>"  
      newhtml << recursive_childs(newtree[key]["hijos"].rehash)
      newhtml << "</li>"
    end
    return newhtml << "</ul>"
  end   
end
