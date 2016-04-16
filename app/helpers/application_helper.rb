# coding: utf-8
module ApplicationHelper
  def get_keywords
    keywords = "蚂蚁共和"
    if @product
      keywords += ",#{@product.name}"
      keywords += ",#{@product.category.name}" unless @product.category.nil?
    end
     
    return keywords
  end
  
  def get_description    
    if @product
      dscp = "产品说明: " + @product.desc unless @product.desc.nil?
    else
      dscp =  "蚂蚁共和"
    end
    
    return dscp
  end
  
  def get_head_title
    #产品-分类-网站名称
    title = ""
    title = "#{ @product.name }-" if @product
    if @product and @product.category
      title += t("category.#{ @product.category.name }")  
    else
      title += t("category.#{@category.name}")  if @category
    end  
                      
    title += "-蚂蚁共和"  
    
    title = "蚂蚁共和"    if self.controller_name == 'home'
    return title  
  end
end
