class PhoneNumbersController < ApplicationController
  before_action :set_phone_number, only: [:show, :edit, :update, :destroy]

  def index
    @phone_numbers = PhoneNumber.all
  end

  def show
  end

  def new
    @phone_number = PhoneNumber.new(contact_id: params[:contact_id], contact_type: params[:contact_type])
  end

  def edit
  end

  def create
    @phone_number = PhoneNumber.new(phone_number_params)
   
    if @phone_number.save
      redirect_to @phone_number.contact, notice: 'Phone number was successfully created.'
    else
      render action: 'new'
    end
    
  end

  def update
    if @phone_number.update(phone_number_params)
      redirect_to @phone_number.contact, notice: 'Phone number was successfully updated!'
    else
      render action: 'edit'
    end
  end

  def destroy
    @phone_number.destroy
    redirect_to @phone_number.contact
    flash.notice = "Phone number was successfully deleted!"
  end

  private
    
    def set_phone_number
      @phone_number = PhoneNumber.find(params[:id])
    end

    def phone_number_params
      params.require(:phone_number).permit(:number, :contact_id, :contact_type)
    end
end
