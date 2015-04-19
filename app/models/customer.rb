class Customer < ActiveRecord::Base
  validates :first_name, :last_name, :address, :city, :postal_code, :email, :province_id, presence: true
  validates :email, format: { with:  /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\Z/, message: 'Invalid email address. Please enter a valid one ex. customer@example.com' }
  validates :postal_code, format: { with: /\A([ABCEGHJKLMNPRSTVXY]\d){3}\Z/, message: 'Invalid postal code. Please eneter a valid one ex. A2B1C2' }

  belongs_to :province
end
