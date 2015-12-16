class TweetsController < ApplicationController
  def new
    @tweet = "Your Tweet"
  end

  def create
    TwitterService.new(current_user).post_tweet(params["Your Tweet"]["content"])
    redirect_to user_path(current_user)
  end

  def favorite
    TwitterService.new(current_user).favorite(params["tweet"])
    redirect_to users_path
  end
end
