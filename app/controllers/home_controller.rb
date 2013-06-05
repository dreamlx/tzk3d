class HomeController < ApplicationController
  def index
     @products = Product.where(["status = ? ", "approved"]).order("updated_at DESC").paginate(page: params[:page], per_page: 40)
    @categorys = Category.all
  end
end
