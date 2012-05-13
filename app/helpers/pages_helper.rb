module PagesHelper

  def pages_tree(pages = Page.roots)
    content_tag :ul do
      pages.map do |page|
        content_tag :li, class: "plegate" do
          link_to(page.title, page_path(page)) + pages_tree(page.pages)
        end
      end.join.html_safe
    end
  end

end
