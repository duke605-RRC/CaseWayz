class Customer < ActiveRecord::Base
  validates :first_name, :last_name, :address, :city, :postal_code, :email, :province_id,
            presence: true
  validates :email, format: { with:  /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\Z/ }
  validates :postal_code, format: { with: /\A([ABCEGHJKLMNPRSTVXY]\d){3}\Z/ }

  belongs_to :province
  has_many :orders

  def tax_rate
    province.safe_gst + province.safe_pst + province.safe_hst
  end

  def make_order(products)
    # Creating order
    order = Order.create_order(itself)
    order.save

    # Creating line items
    products.each do |product|
      line_item = LineItem.create_line_item(order, product, 1)
      line_item.save
    end

    true
  end
end
