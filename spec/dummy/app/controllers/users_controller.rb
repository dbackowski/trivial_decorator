class UsersController < ApplicationController
  def index
    @users = decorate(User.all.page(params[:page]))
  end
end
