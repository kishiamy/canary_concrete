class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  class AdminUserIsRequired < StandardError; end

  rescue_from AdminUserIsRequired do |exception|
    flash.now[:error] = t('general.controllers.forbiden')
    render text: " ", layout: true, status: 403
  end

  protected
    def is_admin
      unless user_signed_in? and current_user.group.admin?
        raise AdminUserIsRequired
      end
    end
  private
    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end
    def default_url_options(options = {})
      {locale: I18n.locale}
    end
end
