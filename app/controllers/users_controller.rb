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
      @users = current_user.except_current_users(@users) # check if the collection contains the current_user
      flash.now[:danger] = "Maybe your friend doesn't have an account" if @users.blank?
    end
    respond_to do |format|
      format.js { render partial: 'friends/result' }
    end
  end

  def add_friend
    @friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: @friend.id)

    if current_user.save
      flash[:success] = "Friend was added"
    else
      flash[:danger] = "There was something wrong"
    end
    redirect_to friends_path
  end

end
