# coding: utf-8
module ApplicationHelper
  def get_keywords
    keywords = "3d图纸,3d图纸库,3d打印,3d打印机,3d打印图纸,在线3d打印,在线3d设计,3d设计平台,3d打印图纸下载"
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
      dscp =  "3d图纸库(3dtzk.com),3d打印机图纸设计、分享、下载平台，包括艺术品，首饰品，小工具，各种玩具、游戏、动漫等人物模型的3d设计图纸。"
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
                      
    title += "-3d图纸库-3dtzk.com"  
    
    title = "3d图纸库-3d打印机图纸下载,在线3d打印模型设计平台"    if self.controller_name == 'home'
    return title  
  end
end
