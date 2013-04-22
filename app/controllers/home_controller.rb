class HomeController < ApplicationController
  def index
    @products = Product.order("created_at desc").paginate(page: params[:page], per_page: 21)
    @categorys = Category.all
  end
end
