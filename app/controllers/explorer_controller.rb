class ExplorerController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @products = @category.products.order("created_at desc").paginate(page: params[:page], per_page: 21)
  end
end
