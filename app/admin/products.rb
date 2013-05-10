ActiveAdmin.register Product do

  show do 
    render "show"
  end

  collection_action :published_items do
    @collection = Product.all
  end
  
  member_action :publish do
    Product.find(params[:id]).approve
    redirect_to(:back)
  end
  
  member_action :unpublish do
    Product.find(params[:id]).disapprove
    redirect_to(:back)
  end
  
  action_item :only => :show do
    status = Product.find(params[:id]).status
    if status != 'approved'
    link_to "publish", publish_admin_product_path 
  else
    link_to "unpublish", unpublish_admin_product_path
  end
  end

  #actions  :index, :destroy, :show
    
end
