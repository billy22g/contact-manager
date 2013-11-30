class EmailAddressesController < ApplicationController

  def new
    @email_address = EmailAddress.new(person_id: params[:person_id])
  end

  def create
    @email_address = EmailAddress.new(email_params)
    if @email_address.save
      redirect_to @email_address.person
      flash.notice = "This email was successfully added to #{@email_address.person.first_name}"
    else
      render action: 'new'
    end
  end

  def email_params
    params.require(:email_address).permit(:address, :person_id)
  end
end
