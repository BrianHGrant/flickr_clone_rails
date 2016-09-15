class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @tags= Tag.where(user_id: current_user.id)
  end
end
