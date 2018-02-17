require 'rails_helper'

RSpec.describe "sponsored_posts/new", type: :view do
  before(:each) do
    assign(:sponsored_post, SponsoredPost.new(
      :title => "MyString",
      :body => "MyText",
      :price => 1
    ))
  end

  it "renders new sponsored_post form" do
    render

    assert_select "form[action=?][method=?]", sponsored_posts_path, "post" do

      assert_select "input[name=?]", "sponsored_post[title]"

      assert_select "textarea[name=?]", "sponsored_post[body]"

      assert_select "input[name=?]", "sponsored_post[price]"
    end
  end
end
