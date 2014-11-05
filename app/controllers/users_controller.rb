class UsersController < ApplicationController

  def show
    user = User.find(show_params[:id])
    @username = user.username
    @tweets = user.tweets.page(params[:page]).per(5).order('created_at DESC')
  end

  private
  def show_params
    params.permit(:id)
  end
end

