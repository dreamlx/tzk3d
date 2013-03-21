# coding: utf-8
feature '用户可以管理：上传下载3d产品' do
  background do
  end

  scenario '访问/products/new, 新建上传模型文件和对应demo图片' do
    visit '/products/new'
    
    page.should have_field "product_model3d"
    page.should have_field "product_photo"
    page.should have_field "product_name"
    page.should have_field "product_price"
    page.should have_field "product_desc"
    page.should have_field "product_size"
  end

end