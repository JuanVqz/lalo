require "rails_helper"

RSpec.describe "orders/index", type: :view do
  let(:line_item) { build(:line_item) }
  let(:order_1) { create(:order, line_items: [line_item]) }
  let(:order_2) { create(:order, line_items: [line_item]) }

  before(:each) do
    assign(:orders, [
      order_1, order_2
    ])
  end

  it "renders a list of orders" do
    render
    cell_selector = Rails::VERSION::STRING >= "7" ? "div>p" : "tr>td"
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
