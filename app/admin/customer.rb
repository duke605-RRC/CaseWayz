ActiveAdmin.register Customer do
  permit_params :first_name, :last_name, :address, :city, :postal_code, :email, :province_id, :created_at, :updated_at

  form(:html => { :multipart => true }) do |f|
    f.inputs "Customer" do
      f.input :first_name
      f.input :last_name
      f.input :address
      f.input :city
      f.input :postal_code
      f.input :email
      f.input :province_id, label: 'Province', as: :select, collection: Province.all.map { |p| [p.name, p.id] }
    end
    f.submit
  end

  index do
    selectable_column
    column :id do |customer|
      link_to customer.id, edit_admin_customer_path(customer)
    end
    column :first_name
    column :last_name
    column :address
    column :city
    column :postal_code
    column :email
    column :province_id do |customer|
      customer.province
    end
    column :created_at
    column :updated_at
    actions
  end
end
