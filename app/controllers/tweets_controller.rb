class TweetsController < ApplicationController

  def index
    @tweets = Tweet.page(params[:page]).per(3).order(:id)
  end

  def new
  end

  def create
    Tweet.create(create_params)
  end

  private
  def create_params
    params.permit(:name, :image, :text, :photo).merge(user_id: current_user.username)
  end
  
end
