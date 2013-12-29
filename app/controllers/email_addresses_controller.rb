class EmailAddressesController < ApplicationController

  def new
    @email_address = EmailAddress.new(contact_id: params[:contact_id], contact_type: params[:contact_type])
  end

  def create
    @email_address = EmailAddress.new(email_params)
    if @email_address.save
      redirect_to @email_address.contact
      flash.notice = "This email was successfully added!"
    else
      render :new
    end
  end

  def destroy
    @email_address = EmailAddress.find(params[:id])
    @email_address.destroy
    redirect_to @email_address.contact
    flash.notice = "Email successfully deleted!"
  end

  def edit
    @email_address = EmailAddress.find(params[:id])
  end

  def update
    @email_address = EmailAddress.find(params[:id])
    @email_address.update(email_params)
    redirect_to @email_address.contact
    flash.notice = "Email successfully updated!"
  end

  private

  def email_params
    params.require(:email_address).permit(:address, :contact_id, :contact_type)
  end
end
