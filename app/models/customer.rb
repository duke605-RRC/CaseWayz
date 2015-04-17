class Customer < ActiveRecord::Base
  validates :first_name, :last_name, :address, :city, :postal_code, :email, :province_id, presence: true
  validates :email, format: { with:  /\A[A-Za-z0-9._%+-]+@[A-Z0-9.-]+\.[A-Za-z]{2,6}\Z/}
  validates :postal_code, format: { with: /\A([ABCEGHJKLMNPRSTVXY]\d){3}\Z/ }
end
