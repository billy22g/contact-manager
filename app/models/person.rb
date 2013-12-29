class Person < ActiveRecord::Base
  has_many :phone_numbers, as: :contact
  has_many :email_addresses, as: :contact
  belongs_to :branch
  
  validates :first_name, :last_name, presence: true

  def self.by_last_name
    order("last_name")
  end
end
