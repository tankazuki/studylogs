class SessionsController < ApplicationController

  def user_new
  end

  def user_create
  end

  def user_destroy
    session.delete(:user_id)
    current_user = nil
  end

end
