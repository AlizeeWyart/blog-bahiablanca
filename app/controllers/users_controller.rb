class UsersController < ApplicationController
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :email, :last_name, :password, :photo, :photo_cache, :twitter_account)
  end
end
