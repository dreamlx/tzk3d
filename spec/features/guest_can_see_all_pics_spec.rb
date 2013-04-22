# coding: utf-8
require 'spec_helper'

feature '访问者希望看到所有圖片的列表' do
  background do
    @categories = {:"Art"        =>"艺术",
                    :"Fashion"    => "流行",
                    :"Gadgets"    => "小玩意",
                    :"Hobby"      => "嗜好",
                    :"Household"  => "家用",
                    :"Learning"   => "学习",
                    :"Models"      => "模型",
                    :"Tools"       => "工具",
                    :"Toys & Games"=> "玩具和游戏",
                    :"3D Printing" => "3D 打印机"
                   }
  end

  scenario '访问/home, 应该显示三維模型圖片列表和分类' do
    visit '/home'

    Product.all.each do |item|
      page.should have_content item.name
    end

    Category.all.each do |item|
      page.should have_content @categories[item.name.to_sym]
    end
  end
end