module PagesHelper
  def parents(page)
    pages = "<a href='#{page_path(page)}'>#{page.title}</a>"
    if page.page
      pages.insert(0, "#{parents(page.page)} > ")
    else
      return pages
    end
  end
end
