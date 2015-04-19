class Province < ActiveRecord::Base
  validates :name, presence: true
  validates :pst, :gst, :hst, numericality: { greater_than_or_equal_to: 0.01 }, allow_nil: true

  has_many :customer

  def safe_gst
    gst || 0
  end

  def safe_pst
    pst || 0
  end

  def safe_hst
    hst || 0
  end
end
