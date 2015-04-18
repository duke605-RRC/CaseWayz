class Product < ActiveRecord::Base
  validates :name, :description, :price, :quantity, :category_id, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  belongs_to :category

  mount_uploader :image, ImageUploader

  def self.filter_by_category(products, category_id)
    return products unless category_id

    return products.where(category_id: category_id)
  end

  def self.filter_by_query(products, query)
    return products unless query

    return products.where("description LIKE '%#{query}%' OR name LIKE '%#{query}%'")
  end

  def self.filter(products, category_id, query)
    products = filter_by_category(products, category_id)
    products = filter_by_query(products, query)
    return products
  end
end
