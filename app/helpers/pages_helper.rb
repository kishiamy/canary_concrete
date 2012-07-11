module PagesHelper
  def breadcrumb(page)
    pages = page.title
    if page.page
      pages.insert(0, "#{parents(page.page)} &gt; ")
    end
    return pages.html_safe
  end
  
  def form_locales
    a = I18n.available_locales
    a.delete(I18n.locale)
    { locale: a[0].to_sym, title: I18n.t("simple_form.labels.page.title", locale: a[0].to_sym), content: I18n.t("simple_form.labels.page.content", locale: a[0].to_sym) }

  def parents(page)
    pages = link_to(page.title, page_path(page)) 
    if page.page
      pages.insert(0, "#{parents(page.page)} &gt; ")
    else
      return pages.html_safe
    end
  end
end
