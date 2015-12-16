class UsersController < ApplicationController

  def index
    @twitter = TwitterService.new(current_user)
  end

  def show
    @twitter = TwitterService.new(current_user)
  end

end
