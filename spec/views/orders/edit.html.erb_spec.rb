require "rails_helper"

RSpec.describe "orders/edit", type: :view do
  let(:line_item) { build(:line_item) }
  let(:order) { create(:order, line_items: [line_item]) }

  before(:each) do
    @order = assign(:order, order)
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "textarea[name=?]", "order[comment]"
    end
  end
end
