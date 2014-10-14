class TweetsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @tweets = Tweet.all
  end

  def new
  end

  def create
    @tweet = Tweet.create(create_params)
  end

  def create_params
    params.permit(:name, :image, :text)
  end
end
