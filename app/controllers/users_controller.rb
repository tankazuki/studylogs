# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in_user @user
      flash[:success] = '新規登録が完了しました'
      redirect_to user_index_url
    else
      flash[:danger] = '新規登録に失敗しました'
      render 'new'
    end
  end

  def sign_out
    sign_out_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
