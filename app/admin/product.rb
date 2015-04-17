ActiveAdmin.register Product do

  permit_params :name, :description, :price, :quantity, :category_id, :created_at, :updated_at

  form(:html => { :multipart => true }) do |f|
    f.inputs "Product" do
      f.input :name
      f.input :description
      f.input :image, :as => :file
    end
    f.submit
  end
end
