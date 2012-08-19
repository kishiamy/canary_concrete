module ApplicationHelper

  def is_admin?
    user_signed_in? and current_user.group.try(:admin?)
  end

end
