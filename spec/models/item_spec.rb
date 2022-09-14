require "rails_helper"

RSpec.describe Item, type: :model do
  describe "validations" do
    let(:item) { build(:item) }

    it "is valid" do
      expect(item).to be_valid
    end

    it "has a name" do
      item.name = nil

      expect(item).to be_invalid
    end

    it "is unique" do
      create(:item, name: "foo")
      item.name = "foo"

      expect(item).to be_invalid
    end
  end
end
