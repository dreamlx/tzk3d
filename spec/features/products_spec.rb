# coding: utf-8
require "spec_helper"
feature "Products" do
  background do
    User.create!(:email => 'user@example.com', :password => 'caplin1234', :password_confirmation => 'caplin1234')
    sign_in('user@example.com','caplin1234')
  end

  describe "GET /products", :type => :feature do
    given(:file){File.new("#{Rails.root}/spec/files/resume.stl", 'rb')}
    given(:product){Product.create!(:name=>"test model",:model3d=>file,:designer=>"test designer")}
  end
end