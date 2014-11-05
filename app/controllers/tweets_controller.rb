class TweetsController < ApplicationController
  before_action :redirect, :only => [:new, :create], unless: :user_signed_in?

  def index
    @tweets = Tweet.page(params[:page]).per(10).order("created_at DESC")
  end

  def new
  end

  def create
    Tweet.create(create_params)
  end

  private
  def create_params
    params.permit(:name, :image, :text).merge(user_id: current_user.id)
  end

  def redirect
    redirect_to :action => "index"
  end
end

