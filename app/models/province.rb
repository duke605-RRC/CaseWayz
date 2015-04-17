class Province < ActiveRecord::Base
  validates :name, presence: true
  validates :pst, :gst, :hst, numericality: { greater_than_or_equal_to: .01 }, allow_nil: true
end
