class Order < ActiveRecord::Base
  validates :status, :customer_id, presence: true
  validates :pst, :gst, :hst, numericality: true, allow_nil: true
  validates :status, inclusion: { in: %w( outstanding paid shipped ) }

  belongs_to :customer
  has_many :line_items

  has_many :products, through: :line_items

  def self.create_order(customer)
    order = Order.new

    order.status = 'outstanding'
    order.pst = customer.province.pst
    order.gst = customer.province.gst
    order.hst = customer.province.hst
    order.customer = customer

    order
  end
end
