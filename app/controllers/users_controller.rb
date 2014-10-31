class UsersController < ApplicationController

  def show
    @user = User.find(show_params[:id])
    @tweets = Tweet.where(user_id: show_params[:id]).page(params[:page]).per(3).order('created_at DESC')
  end

  private
  def show_params
    params.permit(:id)
  end
end

