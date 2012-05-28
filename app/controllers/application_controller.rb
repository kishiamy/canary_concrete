class ApplicationController < ActionController::Base
  protect_from_forgery

  class AdminUserIsRequired < StandardError; end

  rescue_from AdminUserIsRequired do |exception|
    flash.now[:error] = "You don't have permission to be here!"
    render text: " ", layout: true, status: 403
  end

  protected
    def is_admin
      unless user_signed_in? and current_user.group.admin?
        raise AdminUserIsRequired
      end
    end

end
