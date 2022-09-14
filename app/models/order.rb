class Order < ApplicationRecord
  has_many :line_items

  validates :line_items, presence: true
end
