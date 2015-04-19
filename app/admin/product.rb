ActiveAdmin.register Product do
  permit_params :name, :description, :price, :quantity, :image, :category_id

  form(html: { multipart: true }) do |f|
    f.inputs 'Product' do
      f.input :name
      f.input :description
      f.input :price
      f.input :quantity
      f.input :category_id, label: 'Category', as: :select, collection: Category.all.map { |c| [c.name, c.id] }
      f.input :image, as: :file
    end
    f.submit
  end

  index do
    selectable_column
    column :id do |product|
      link_to product.id, edit_admin_product_path(product)
    end
    column :name
    column :description
    column :price
    column :quantity
    column :image do |product|
      image_tag product.image.list_display.url
    end
    column :category_id do |product|
      product.category.name
    end
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :description
      row :price
      row :quantity
      row :image do
        image_tag product.image.thumb.url
      end
      row :category_id
      row :created_at
      row :updated_at
      active_admin_comments
    end
  end
end
