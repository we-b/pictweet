class TweetsController < ApplicationController

  def index
    @tweets = Tweet.page(params[:page]).per(10).order("created_at DESC")
  end

  def new
    unless user_signed_in?
      redirect_to :action => "index"
    end
  end

  def create
    unless user_signed_in?
      redirect_to :action => "index"
    else
      Tweet.create(create_params)
    end
  end

  private
  def create_params
    params.permit(:name, :image, :text)
  end
end
