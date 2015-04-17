ActiveAdmin.register Contact do
  permit_params :description, :phone, :email, :address
end
