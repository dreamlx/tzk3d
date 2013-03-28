module ProductsHelper
  def h_product_nav
    case session[:product_nav]
    when "index"
      link_to "Home", root_path
    when "favor"
      link_to "Favor", favor_products_path
    when "uploaded"
      link_to "Uploaded", uploaded_products_path
    when "purchase"
      link_to "Purchase", purchase_products_path
    else
    end
      
  end
end
