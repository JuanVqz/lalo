class Item < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
