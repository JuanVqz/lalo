FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "item_#{n}" }
    description { "MyText" }
    in_stock { true }
    sale_price { "0.00" }
  end
end
