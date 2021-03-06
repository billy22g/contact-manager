require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the company view', type: :feature do

  let(:company) { Company.create(name: 'Walmart') }

  before(:each) do
    company.phone_numbers.create(number: "555-1234")
    company.phone_numbers.create(number: "555-5678")
    company.email_addresses.create(address: "billy@basedirectory.com")
    company.email_addresses.create(address: "anthony@basedirectory.com")
    visit company_path(company)
  end

  it 'shows the phone numbers' do
    company.phone_numbers.each do |phone|
      expect(page).to have_content(phone.number)
    end
  end

  it 'has a link to add a new phone number' do
    expect(page).to have_link('Add Phone Number', href: new_phone_number_path(contact_id: company.id, contact_type: 'Company'))
  end

  it 'has a link to delete a phone number' do 
    expect(page).to have_link('Delete')
  end

  it 'adds a new phone number' do 
    page.click_on('Add Phone Number')
    page.fill_in('Number', with: '555-8888')
    page.click_on('Create Phone number')
    expect(current_path).to eq(company_path(company))
    expect(page).to have_content('555-8888')
  end

  it 'shows the email addresses' do
    company.email_addresses.each do |email|
      expect(page).to have_content(email.address)
    end
  end

  it 'has a link to add a new email address' do
    expect(page).to have_link('Add Email Address', href: new_email_address_path(contact_id: company.id, contact_type: 'Company'))
  end

  it 'has a link to delete a email address' do 
    expect(page).to have_link('Delete')
  end

  it 'adds a new email address' do 
    page.click_on('Add Email Address')
    page.fill_in('Address', with: 'billy@miltraveler.com')
    page.click_on('Create Email address')
    expect(current_path).to eq(company_path(company))
    expect(page).to have_content('billy@miltraveler.com')
  end

end
