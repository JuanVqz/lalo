require "rails_helper"

RSpec.describe Order, type: :model do
  describe "validations" do
    let(:line_items) { build_list(:line_item, 1) }
    let(:order) { build(:order, line_items: line_items) }

    it "is valid" do
      expect(order).to be_valid
    end

    it "requires at least one line_item" do
      order.line_items = []

      expect(order).to be_invalid
    end
  end
end
