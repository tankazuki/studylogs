class HomeController < ApplicationController
  before_action :authenticate_user!, only:[:index]

  def top
  end

  def index
  end

end
