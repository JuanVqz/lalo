require "rails_helper"

RSpec.describe LineItem, type: :model do
  describe "validations" do
    let(:line_item) { build(:line_item) }

    it "is valid" do
      expect(line_item).to be_valid
    end

    it "requires an order" do
      line_item.order = nil

      expect(line_item).to be_invalid
    end

    it "requires an item" do
      line_item.item = nil

      expect(line_item).to be_invalid
    end
  end
end
