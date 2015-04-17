class ContactController < ApplicationController
  def show
    @contact = Contact.first || OpenStruct.new(description: 'No content', phone: 'Please add a phone number', email: 'Please add and email', address: 'Please add an address')
  end
end
