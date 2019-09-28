class UsersController < ApplicationController

  def portafolio
    @user = current_user
    @user_stocks = current_user.stocks
  end

  def friends
    @friendships = current_user.friends
  end

  def search
    if params[:search_param].blank?
      flash.now[:danger] = "You have entered nothing"
    else
      @users = User.search(params[:search_param])
      flash.now[:danger] = "Maybe your friend doesn't have an account" if @users.blank?
    end
    respond_to do |format|
      format.js { render partial: 'friends/result' }
    end
  end

end
