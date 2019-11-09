# frozen_string_literal: true

module SessionsHelper
  def sign_in_user(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def sign_in_user?
    !current_user.nil?
  end

  def sign_out_user
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end

  def authenticate_user!
    unless sign_in_user?
      flash[:danger] = 'ログインしてください'
      redirect_to root_path
    end
  end

  def no_need_to_authenticate!
    if sign_in_user?
      flash[:danger] = 'ログイン時にこの操作はできません'
      redirect_to user_index_url
    end
  end
end
