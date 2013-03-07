# coding: utf-8
feature '访问者希望看到所有帖子的列表' do
  scenario '访问/topics, 应该显示所有帖子' do
    visit '/topics'

    page.should have_content "DHH 的公开课"
    page.should have_content "Rails3 中 compass 的 IE 使用问题"
    page.should have_content "这周二上海搞Ruby Tuesday么？"
  end
end