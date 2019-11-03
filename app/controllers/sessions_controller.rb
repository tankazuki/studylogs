class SessionsController < ApplicationController
  protect_from_forgery :except => [:session]

  def user_new
    @user = User.new
  end

  def user_create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in_user user
      flash[:success] = 'ログインに成功しました'
      redirect_to root_path
    else
      flash[:danger] = 'ログインに失敗しました'
      render "user_new"
    end

  end

  def user_destroy
    session.delete(:user_id)
    current_user = nil
  end

end
