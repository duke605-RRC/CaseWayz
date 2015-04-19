class Order < ActiveRecord::Base
  validates :status, :customer_id, presence: true
  validates :pst, :gst, :hst, numericality: true, allow_nil: true
  validates :status, inclusion: { in: %w( outstanding paid shipped ) }

  belongs_to :customer
  has_many :line_items
end
