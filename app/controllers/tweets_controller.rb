class TweetsController < ApplicationController
  # before_filter :authenticate_user!

  def index
    @tweets = Tweet.page(params[:page]).per(3).order(:id).order('created_at DESC')
  end

  def new
  end

  def create
    Tweet.create(create_params)
    # @tweet = Tweet.create(create_params)
    # @tweet.photos.build
  end

  private
  def create_params
    params.permit(:name, :image, :text, :photo).merge(user_id: current_user.id)
  end
end
