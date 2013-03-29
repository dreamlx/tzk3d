module ProductsHelper
  def h_product_nav
    case session[:product_nav]
    when "index"
      link_to t(:home, scope: :views), root_path
    when "favor"
      link_to t(:nav_favor, scope: :views), favor_products_path
    when "uploaded"
      link_to t(:nav_uploaded, scope: :views), uploaded_products_path
    when "purchase"
      link_to t(:purchase, scope: :views), purchase_products_path
    else
    end
      
  end
end
