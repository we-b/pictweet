class TweetsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate_user!

  def index
    @tweets = Tweet.page(params[:page]).per(3).order(:id)
  end

  def new
  end

  def create
    @tweet = Tweet.create(create_params)
  end

  def create_params
    params.permit(:name, :image, :text).merge(user_id: current_user.username)
  end
end
