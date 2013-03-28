class ApplicationController < ActionController::Base
  protect_from_forgery
  after_filter :put_nav, only: [:index, :purchase, :favor, :uploaded]
  
  def put_nav
    session[:product_nav] = params[:action]
  end
end
