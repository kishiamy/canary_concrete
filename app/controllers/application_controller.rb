class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  def is_admin
   unless current_user.group_id == 1
     redirect_to root_url, :notice =>"You don't have permission to be here!"
   end
  end
  helper_method :is_admin
end
