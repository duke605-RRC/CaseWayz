ActiveAdmin.register LineItem do
  permit_params :quantity, :price, :order_id, :product_id

  filter :order, as: :select, collection: Order.all.map { |o| ["Order ##{o.id}", o.id] }
  filter :product, as: :select, collection: Product.all.map { |p| [p.name, p.id] }
  filter :customer, as: :select, collection: Customer.all.map { |c| ["#{c.first_name} #{c.last_name}", c.id] }
  filter :quantity
  filter :price
  filter :created_at
  filter :updated_at

  index do
    selectable_column
    column :id do |line_item|
      link_to line_item.id, admin_line_item_path(line_item)
    end
    column :quantity
    column :price
    column :order_id do |line_item|
      link_to line_item.order_id, admin_order_path(line_item.order)
    end
    column :product_id do |line_item|
      link_to line_item.product_id, admin_customer_path(line_item.product)
    end
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs 'Line Item' do
      f.input :product_id, label: 'Product', as: :select, collection: Product.all.map { |p| [p.name, p.id] }
      f.input :order_id
      f.input :quantity
      f.input :price
    end
    f.submit
  end
end
