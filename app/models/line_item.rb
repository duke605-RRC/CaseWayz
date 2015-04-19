class LineItem < ActiveRecord::Base
  validates :quantity, :price, :order_id, :product_id, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  belongs_to :order
end
