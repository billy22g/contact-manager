class Person < ActiveRecord::Base
  has_many :phone_numbers, as: :contact
  has_many :email_addresses
  
  validates :first_name, :last_name, presence: true

  def self.by_last_name
    order("last_name")
  end
end
