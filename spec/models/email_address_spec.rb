require 'spec_helper'

describe EmailAddress do

  let(:email_address) do 
    EmailAddress.new(address: "me@example.com", person_id: 1)
  end

  it "is valid" do
    expect(email_address).to be_valid
  end

  it "is invalid without an email address" do
    email_address.address = nil
    expect(email_address).not_to be_valid
  end

  it "is invalid without being associated with a person" do 
    email_address.person_id = nil
    expect(email_address).not_to be_valid
  end
end
