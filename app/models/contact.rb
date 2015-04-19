class Contact < ActiveRecord::Base
  validates :description, :phone, :email, :address, presence: true
  validates :email, format: { with:  /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\Z/ }
end
