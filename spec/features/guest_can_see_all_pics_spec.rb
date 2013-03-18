# coding: utf-8
feature '访问者希望看到所有圖片的列表' do
  background do
  end

  scenario '访问/products, 应该显示三維模型圖片列表' do
    visit '/products'

    Model3d.all.each do |item|
      page.should have_content item.name
    end
  end
end