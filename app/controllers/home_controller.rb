class HomeController < ApplicationController
  before_action :authenticate_user!, only:[:index]
  before_action :no_need_to_authenticate!, only:[:top]

  def top
  end

  def index
  end

end
