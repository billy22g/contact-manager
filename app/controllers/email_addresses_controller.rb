class EmailAddressesController < ApplicationController

  def new
    @email_address = EmailAddress.new(person_id: params[:person_id])
  end

  def create
    @email_address = EmailAddress.new(email_params)
    if @email_address.save
      redirect_to @email_address.person
      flash.notice = "This email was successfully added for #{@email_address.person.first_name}"
    else
      render :new
    end
  end

  def destroy
    @email_address = EmailAddress.find(params[:id])
    @email_address.destroy
    redirect_to @email_address.person
    flash.notice = "Email successfully deleted!"
  end

  def email_params
    params.require(:email_address).permit(:address, :person_id)
  end
end
