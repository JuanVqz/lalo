require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  let(:line_item) { build(:line_item) }
  let(:order) { create(:order, line_items: [line_item]) }

  before(:each) do
    @order = assign(:order, order)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
