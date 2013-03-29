class HomeController < ApplicationController
  def index
    @products = Product.paginate(page: params[:page], per_page: 21)
  end
end
