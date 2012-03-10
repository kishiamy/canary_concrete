class AdminController < ApplicationController
   
  def manage_groups
    @users = User.all
    @groups = Group.all

    respond_to do |format|
      format.html 
      format.json { render json: @users, @groups }
      
    end 
end
