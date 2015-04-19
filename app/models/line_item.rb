class LineItem < ActiveRecord::Base
  validates :quantity, :price, :order_id, :product_id, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  belongs_to :order
  belongs_to :product

  has_one :customer, through: :order

  def self.create_line_item(order, product, quantity)
    line_item = LineItem.new

    line_item.quantity = quantity
    line_item.price = product.price
    line_item.order = order
    line_item.product = product

    line_item
  end
end
