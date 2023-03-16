class Product < ApplicationRecord
  validates :title, presence: true
  validates :desciption, presence: true
  validates :price, presence: true
end
