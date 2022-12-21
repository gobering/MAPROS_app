class Users::SessionsController < Devise::SessionsController

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_path(current_user.id), notice: 'ゲストユーザーとしてログインしました。'
  end

  def admin_guest_sign_in
    user = User.guest_admin
    sign_in user
    redirect_to user_path(current_user.id), notice: '管理者ユーザーとしてログインしました。'
  end
end