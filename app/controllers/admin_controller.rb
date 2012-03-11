class AdminController < ApplicationController
   
  def manage_groups
    @users = User.all

    respond_to do |format|
      format.html 
      format.json { render json: @users }      
    end 
  end

  def update
    @user = User.find(params[:id])
    @user.group_id = params[:user][:group_id]

    respond_to do |format|
      if @user.save!
        format.html { redirect_to user_list_path, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "manage_groups" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
