FactoryBot.define do
  factory :line_item do
    order
    item
    quantity { 1.0 }
  end
end
