class Customer < ActiveRecord::Base
  validates :first_name, :last_name, :address, :city, :postal_code, :email, :province_id,
            presence: true
  validates :email, format: { with:  /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\Z/ }
  validates :postal_code, format: { with: /\A([ABCEGHJKLMNPRSTVXY]\d){3}\Z/ }

  belongs_to :province
  has_many :orders

  has_many :line_items, through: :orders

  def tax_rate
    province.safe_gst + province.safe_pst + province.safe_hst
  end

  def make_order(products, flash, session)
    flash[:notice], flash[:code] = ['There was an error creating your order! Please try again.', 1]

    # Saving customer
    return false unless save

    # Creating order
    order = Order.create_order(itself)
    order.save

    # Creating line items
    products.each do |product|
      LineItem.create_line_item(order, product, 1).save
    end

    flash[:notice], flash[:code] = ['Order successfully created!', 0]
    session[:cart] = []
    true
  end
end
