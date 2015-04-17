class Product < ActiveRecord::Base
  validates :name, :description, :price, :quantity, :category_id, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :price, numericality: { greater_than: 0.00 }
end
