class UsersController < ApplicationController
  def show
    @user = current_user
    gon.users = DangerousSpot.where(user_id: current_user.id)
  end
end
