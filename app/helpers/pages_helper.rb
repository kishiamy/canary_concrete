module PagesHelper
  def print_tree(tree = [])
    html = ""
    tree.each do |page|
      html << "<li class='li_menu'>"
      html << "<a href='/pages/#{page.id}'>#{page.title}</a>"
      html << " <div><a href='/pages/#{page.id}/edit' class='btn btn-primary'><i class='icon-pencil icon-white'></i> Edit </a>"
      html << " <a href='/pages/#{page.id}' class='btn btn-danger' data-confirm='Are you sure?' data-method='delete' rel='nofollow'><i class='icon-trash icon-white'></i>Delete</a>"
      html << " <a href='/pages/#{page.id}/pages/new' class='btn btn-primary'><i class='icon-plus icon-white'></i> add sub-page</a></div>"
      html << "</li>"
      if page[:childs]
        html << "<ul class='subpages'>"
        html << print_tree(page[:childs]) 
        html << "</ul>"
      end
    end
    return html.html_safe
  end
  def breadcrumb(page)
    pages = page.title
    if page.page
      pages.insert(0, "#{parents(page.page)} > ")
    end
    return pages.html_safe
  end
  def parents(page)
    pages = "<a href='#{page_path(page)}'>#{page.title}</a>"
    if page.page
      pages.insert(0, "#{parents(page.page)} > ")
    else
      return pages.html_safe
    end
  end

  def print_tree2(tree = [])
    # html = ""
    tree.each do |page|
      content_tag :li, class: "li_menu" do 
        link_to(page.title, page_path(page)) 
        content_tag :div do
          link_to("Edit", edit_page_path(page)) 
          link_to("Delete", page_path(page), :method =>"delete", :confirm =>"")
          link_to("add sub-page", new_page_page_path(page))
          # html << " <div><a href='/pages/#{page.id}/edit' class='btn btn-primary'><i class='icon-pencil icon-white'></i> Edit </a>"
          # html << " <a href='/pages/#{page.id}' class='btn btn-danger' data-confirm='Are you sure?' data-method='delete' rel='nofollow'><i class='icon-trash icon-white'></i>Delete</a>"
          # html << " <a href='/pages/#{page.id}/pages/new' class='btn btn-primary'><i class='icon-plus icon-white'></i> add sub-page</a></div>"
        end
        if page[:childs]
          content_tag :ul, class: "subpages" do
           print_tree2(page[:childs])            
          # html << "<ul class='subpages'>"
          # html << print_tree(page[:childs]) 
          end
        end
      end
    # return html.html_safe
    end
  end.html_safe
end
