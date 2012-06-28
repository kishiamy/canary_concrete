module PagesHelper
  def breadcrumb(page)
    pages = page.title
    if page.page
      pages.insert(0, "#{parents(page.page)} &gt; ")
    end
    return pages.html_safe
  end

  def parents(page)
    pages = link_to(page.title, page_path(page)) 
    if page.page
      pages.insert(0, "#{parents(page.page)} &gt; ")
    else
      return pages.html_safe
    end
  end
end
