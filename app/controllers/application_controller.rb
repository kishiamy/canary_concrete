class ApplicationController < ActionController::Base
  protect_from_forgery

  # @nav_pages = Page.where(:page_id => nil) 

  def auto_pages
    if Page.all.length > 0
      html = ""
      Page.tree.each_key do |key|
        html << "<li class='li_menu'>"
        html << "<a href='/pages/" + Page.tree[key].id.to_s + "'>" + Page.tree[key].title + "</a>"
        html << " <div><a href='/pages/#{Page.tree[key].id.to_s}/edit' class='btn btn-primary'><i class='icon-pencil icon-white'></i> Edit </a>"
        html << " <a href='/pages/#{Page.tree[key].id.to_s}' class='btn btn-danger' data-confirm='Are you sure?' data-method='delete' rel='nofollow'><i class='icon-trash icon-white'></i>Delete</a>"
        html << " <a href='/pages/#{Page.tree[key].id.to_s}/pages/new' class='btn btn-primary'><i class='icon-plus icon-white'></i> add sub-page</a></div>"
        html << "</li>"
        html << recursive_childs(Page.tree[key]["hijos"].rehash)
      end
      return html.html_safe
    end
  end
  helper_method :auto_pages
  def recursive_childs newtree={}
    newhtml = "<ul class='sub-tree'>"
    newtree.each_key do |key|
      newhtml << "<li class='li_menu'>"
      newhtml << "<a href='/pages/" + newtree[key].id.to_s + "'>" + newtree[key].title + "</a>"  
      newhtml << " <div><a href='/pages/#{newtree[key].id.to_s}/edit' class='btn btn-primary'><i class='icon-pencil icon-white'></i> Edit </a>"
      newhtml << " <a href='/pages/#{newtree[key].id.to_s}' class='btn btn-danger' data-confirm='Are you sure?' data-method='delete' rel='nofollow'><i class='icon-trash icon-white'></i>Delete</a>"
      newhtml << " <a href='/pages/#{newtree[key].id.to_s}/pages/new' class='btn btn-primary'><i class='icon-plus icon-white'></i> add sub-page</a></div>"
      newhtml << "</li>"
      newhtml << recursive_childs(newtree[key]["hijos"].rehash)
    end
    return newhtml << "</ul>"
  end   
end
