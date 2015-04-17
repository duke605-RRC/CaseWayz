ActiveAdmin.register Category do
  permit_params :name, :description, :created_at, :updated_at
end
