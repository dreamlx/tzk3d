class ExplorerController < ApplicationController
  def index
    @category = Category.find(params[:id])
  end
  
  def show
    @category = Category.find(params[:id])
    @products = @category.products.paginate(page: params[:page], per_page: 21)
  end
end
