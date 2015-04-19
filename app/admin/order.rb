ActiveAdmin.register Order do
  permit_params :status, :pst, :gst, :hst, :customer_id

  filter :customer, as: :select, collection: Customer.all.map { |c| ["#{c.first_name} #{c.last_name}", c.id] }
  filter :status
  filter :pst
  filter :gst
  filter :hst
  filter :created_at
  filter :updated_at

  index do
    selectable_column
    column :id do |order|
      link_to order.id, admin_order_path(order)
    end
    column :status
    column :pst
    column :gst
    column :hst
    column :customer_id do |order|
      link_to "#{order.customer.first_name} #{order.customer.last_name}", admin_customer_path(order.customer)
    end
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :customer do
        link_to "#{order.customer.first_name} #{order.customer.last_name}", admin_customer_path(order.customer)
      end
      row :pst
      row :gst
      row :hst
      row :created_at
      row :updated_at
      active_admin_comments
    end
  end
end
