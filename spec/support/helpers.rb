module HelperMethods

  def login(user)
    visit new_user_session_path
    fill_in 'E-mail', :with => user.email
    fill_in 'Password', :with => user.password
    find(".actions .btn").click
  end

  def logout
    click_link 'Logout'
  end

  def wait_until_we_see(element)
    wait_until { page.find(element).visible? }
  rescue Capybara::TimeoutError
    flunk 'Element #{element} not appearing'
  end

end
