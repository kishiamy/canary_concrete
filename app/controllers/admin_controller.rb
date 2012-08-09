class AdminController < ApplicationController
  before_filter :is_admin  
  
  def manage_activations
    @users = User.where(:approved => false)
  end 

  def update_activation
    @user = User.find(params[:id])
    @user.approved = params[:approved]

    respond_to do |format|
      if @user.save!
        format.html { redirect_to manage_activations_path, notice: t('general.controllers.notice_user') }
        format.json { head :no_content }
      else
        format.html { render action: "manage_activations" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

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
      if @user.save
        format.html { redirect_to user_list_path, notice: t('general.controllers.notice') }
        format.json { head :no_content }
      else
        format.html { render action: "manage_groups" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
