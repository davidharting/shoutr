class FollowersController < ApplicationController
  def index
    @user = User.find_by(username: params[:user_id])
    @followers = @user.followers
  end

  private

  def find_user
    # It's :user_id instead of :id because its in a nested resource route
    @_user ||= User.find_by(username: params[:user_id])
  end
end
