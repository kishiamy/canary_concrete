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
  
  def form_locales
    a = I18n.available_locales
    a.delete(I18n.locale)
    { locale: a[0].to_sym, title: I18n.t("simple_form.labels.page.title", locale: a[0].to_sym), content: I18n.t("simple_form.labels.page.content", locale: a[0].to_sym) }
  end
end
