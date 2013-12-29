require 'spec_helper'

describe Person do

  let(:person) do
    Person.new(first_name: "Alice", last_name: "Smith")
  end

  it "is valid" do
    expect(person).to be_valid
  end

  it "is invalid without a first name" do
    person.first_name = nil
    expect(person).not_to be_valid
  end

  it "is invalid without a last name" do
    person.last_name = nil
    expect(person).not_to be_valid
  end

  it "responds with its phone numbers after they're created" do
    phone_number = person.phone_numbers.build(number: "333-4444")
    expect(phone_number.number).to eq('333-4444')
  end

  it "responds with its emails after they're created" do 
    email_address = person.email_addresses.build(address: "billy@basedirectory.com")
    expect(email_address.address).to eq("billy@basedirectory.com")
  end
end
