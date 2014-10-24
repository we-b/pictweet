class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def new
  end

  def create
    Tweet.create(create_params)
  end

  private
  def create_params
    params.permit(:name, :image, :text)
  end

end
