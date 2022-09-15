class Item < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :line_items
end
