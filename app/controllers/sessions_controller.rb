class SessionsController < ApplicationController
  protect_from_forgery :except => [:session]
  before_action :no_need_to_authenticate!, only:[:user_new, :user_create]

  def user_new
    @user = User.new
  end

  def user_create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in_user user
      flash[:success] = 'ログインに成功しました'
      redirect_to user_index_url
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
