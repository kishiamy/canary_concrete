class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  def is_admin
    if user_signed_in? == true
      unless current_user.group.name == "Admin" 
        redirect_to root_url, :notice =>"You don't have permission to be here!"
      end
    else
      redirect_to root_url, :notice =>"You don't have permission to be here!" #DRY!
    end
  end

end
