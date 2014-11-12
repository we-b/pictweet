class UsersController < ApplicationController

  def show
    user = User.find(show_params[:id])
    @nickname = user.nickname
    @tweets = user.tweets.page(params[:page]).per(5).order('created_at DESC')
    # user = User.find(show_params[:id])
    # @nickname = user.nickname
    # @tweets = Tweet.where(user_id: user.id).page(params[:page]).per(5).order('created_at DESC')
  end

  private
  def show_params
    params.permit(:id)
  end
end
