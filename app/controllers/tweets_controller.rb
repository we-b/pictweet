class TweetsController < ApplicationController

  before_action :redirect_to_index, :except => [:index]

  def index
    @tweets = Tweet.page(params[:page]).per(5).order("created_at DESC")
  end

  def new
  end

  def create
    Tweet.create(create_params)
    # Tweet.create(image: create_params[:image], text: create_params[:text], user_id: current_user.id)
  end

  def destroy
    tweet = Tweet.find(id_params[:id])
    tweet.destroy if tweet.user_id == current_user.id
    redirect_to :action => "index"
  end

  def edit
    @tweet = Tweet.find(id_params[:id])
  end

  def update
    tweet = Tweet.find(id_params[:id])
    tweet.update_attributes(update_params)
  end

  private
  def create_params
    params.permit(:image, :text).merge(user_id: current_user.id)
    # params.permit(:image, :text)
  end

  def update_params
    params.permit(:image, :text)
  end

  def id_params
    params.permit(:id)
  end

  def redirect_to_index
    redirect_to :action => "index" unless user_signed_in?
  end
end
