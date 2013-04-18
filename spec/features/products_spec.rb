# coding: utf-8
feature "Products" do
  background do
    User.create!(:email => 'user@example.com', :password => 'caplin1234', :password_confirmation => 'caplin1234')
  end

  describe "POST /products GET /products", :type => :feature do
    it "creates product" do
      sign_in('user@example.com','caplin1234')
      click_link "上传模型"
      visit new_product_path
      fill_in "product_name", :with => "mow lawn"
      attach_file('product_model3d', '/home/wyh77/下载/resume.stl')
      click_button "新增模型"
      # save_and_open_page
      page.should have_content("Product was successfully created.")
      page.should have_content("下载模型")
      click_button "加入最爱"
      find('form.button_to').should have_button('移出最爱')
      visit products_path
      page.should have_content("mow lawn")
    end
  end
end