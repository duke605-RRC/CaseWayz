class Product < ActiveRecord::Base
  validates :name, :description, :price, :quantity, :category_id, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  belongs_to :category

  mount_uploader :image, ImageUploader

  def self.filter_by_sale(products, sale)
    return products unless sale == 'on'

    products.where!("price LIKE '%.98'")
  end

  def self.filter_by_new(products, new)
    return products unless new == 'on'

    products.where!('created_at > :date', date: 3.week.ago)
  end

  def self.filter_by_category(products, category_id)
    return products unless category_id
    return products if category_id == 'all'

    products.where!(category_id: category_id)
  end

  def self.filter_by_query(products, query)
    return products unless query

    products.where!("name LIKE '%#{query}%' OR description LIKE '%#{query}%'")
  end

  def self.filter(products, params)
    filter_by_category(products, params[:category])
    filter_by_query(products, params[:query])
    filter_by_sale(products, params[:sale])
    filter_by_new(products, params[:new])
  end
end
