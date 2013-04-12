require 'spec_helper'

describe "categories/index" do
  before(:each) do
    assign(:categories, [
      stub_model(Category,
        :name => "Name",
        :parent_id => 1,
        :lft => 2,
        :rgt => 3,
        :depth => 4
      ),
      stub_model(Category,
        :name => "Name",
        :parent_id => 1,
        :lft => 2,
        :rgt => 3,
        :depth => 4
      )
    ])
  end

  it "renders a list of categories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
