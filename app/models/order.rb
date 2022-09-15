class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy

  validates :line_items, presence: true

  accepts_nested_attributes_for :line_items, allow_destroy: true
end
