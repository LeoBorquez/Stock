class UsersController < ApplicationController

  def portafolio
    @user = current_user
    @user_stocks = current_user.stocks
  end

end
