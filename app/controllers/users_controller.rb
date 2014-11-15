class UsersController < ApplicationController

  def show
    user = User.find(show_params[:id])
    @nickname = user.nickname
    @tweets = user.tweets.page(params[:page]).per(5).order('created_at DESC')
    # user = User.find(show_params[:id])
    # @nickname = user.nickname
    # @tweets = Tweet.where(user_id: user.id).page(params[:page]).per(5).order('created_at DESC')
  end

  def likes
    # @likes = Like.includes(:user).(show_params[:id]).likes
    @likes = User.find(show_params[:id]).likes.includes(:tweet)
    # @likes = Like.where(user_id: user.id)
  end

  private
  def show_params
    params.permit(:id)
  end
end
