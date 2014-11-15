class LikesController < ApplicationController
  def create
   Like.create(user_id: current_user.id, tweet_id: create_params[:tweet_id])
   redirect_to(:back)
  end

  def destroy
    Like.find_by(user_id: current_user.id, tweet_id: create_params[:tweet_id]).destroy
    redirect_to(:back)
  end

  private
    def create_params
      params.permit(:tweet_id)
    end
end
