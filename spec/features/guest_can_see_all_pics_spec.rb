# coding: utf-8
feature '访问者希望看到所有圖片的列表' do
  background do
  end

  scenario '访问/home, 应该显示三維模型圖片列表和分类' do
    visit '/home'

    Product.all.each do |item|
      page.should have_content item.name
    end
    
    Category.all.each do |item|
      page.shold have_content item.name
    end
  end
end