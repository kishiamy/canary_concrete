module HelperMethods

  def login(user)
    visit new_user_session_path(:locale => 'en')
    fill_in 'E-mail', :with => user.email
    fill_in 'Password', :with => user.password
    find(".actions .btn").click
  end

  def logout
    click_link 'Logout'
    sleep 3
  end

  def wait_until_we_see(element)
    wait_until { page.find(element).visible? }
  rescue Capybara::TimeoutError
    flunk 'Element #{element} not appearing'
  end

  def default_url_options(options = {})
    {locale: I18n.locale}
  end
end
