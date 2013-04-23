# coding: utf-8
feature "Products" do
  background do
    User.create!(:email => 'user@example.com', :password => 'caplin1234', :password_confirmation => 'caplin1234')
    sign_in('user@example.com','caplin1234')
  end

  describe "GET /products", :type => :feature do
    given(:file){File.new("#{Rails.root}/spec/files/resume.stl", 'rb')}
    given(:product){Product.create!(:name=>"test model",:model3d=>file,:designer=>"test designer")}
    it "show currently created product" do
      product
      visit products_path
      page.should have_content("test model")
    end

    it "should show product detail by id" do
      visit product_path(product)
      page.should have_content("test designer")
    end

    it "should save downloaded file" do
      visit product_path(product)
      click_link "下载模型"
      page.response_headers['Content-Type'].should == "text/plain"
    end
  end

  describe "POST /products GET /products", :type => :feature do
    it "creates product" do
      click_link "上传模型"
      visit new_product_path
      fill_in "product_name", :with => "mow lawn"
      attach_file('product_model3d', "#{Rails.root}/spec/files/resume.stl")
      click_button "新增模型"
      # save_and_open_page
      page.should have_content("Product was successfully created.")
      page.should have_content("下载模型")
      click_button "加入最爱"
      find('form.button_to').should have_button('移出最爱')
      visit products_path
      page.should have_content("mow lawn")
    end

    it "should invalid when uploading model3d with non *.stl file" do
      expect{Product.create!(:name=>"test model",:model3d=>"#{Rails.root}/spec/files/resume.pdf")}.to raise_error
      visit new_product_path
      fill_in "product_name", :with => "test model 3d"
      attach_file('product_model3d', "#{Rails.root}/spec/files/resume.pdf")
      click_button "新增模型"
      visit products_path
      page.should_not have_content("test model 3d")
    end
  end
end