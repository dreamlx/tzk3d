require 'spec_helper'

describe "categories/show" do
  before(:each) do
    @category = assign(:category, stub_model(Category,
      :name => "Name",
      :parent_id => 1,
      :lft => 2,
      :rgt => 3,
      :depth => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
  end
end
