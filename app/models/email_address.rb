class EmailAddress < ActiveRecord::Base
  belongs_to :contact

  validates :address, :person_id, presence: true
end
