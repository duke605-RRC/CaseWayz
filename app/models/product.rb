class Product < ActiveRecord::Base
  validates :name, :description, :price, :quantity, :category_id, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  belongs_to :category

  mount_uploader :image, ImageUploader

  def self.filter_by_sale(products, sale)
    return products unless sale
    return products unless sale == 'on'

    return products.where("price LIKE '%.98'")
  end

  def self.filter_by_category(products, category_id)
    return products unless category_id
    return products if category_id == 'all'

    return products.where(category_id: category_id)
  end

  def self.filter_by_query(products, query)
    return products unless query

    return products.where("name LIKE '%#{query}%' OR description LIKE '%#{query}%'")
  end

  def self.filter(products, params)
    products = filter_by_category(products, params[:category])
    products = filter_by_query(products, params[:query])
    products = filter_by_sale(products, params[:sale])

    return products
  end
end
