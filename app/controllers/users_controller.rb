class UsersController < ApplicationController

  def index
    @twitter = TwitterService.new(current_user)
    @tweet = "Your Tweet"
  end

  def show
    @twitter = TwitterService.new(current_user)
    @tweet = "Your Tweet"
  end

end
