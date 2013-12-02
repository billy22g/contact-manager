class PhoneNumbersController < ApplicationController
  before_action :set_phone_number, only: [:show, :edit, :update, :destroy]

  # GET /phone_numbers
  # GET /phone_numbers.json
  def index
    @phone_numbers = PhoneNumber.all
  end

  # GET /phone_numbers/1
  # GET /phone_numbers/1.json
  def show
  end

  # GET /phone_numbers/new
  def new
    @phone_number = PhoneNumber.new(contact_id: params[:contact_id], contact_type: params[:contact_type])
  end

  # GET /phone_numbers/1/edit
  def edit
  end

  # POST /phone_numbers
  # POST /phone_numbers.json
  def create
    @phone_number = PhoneNumber.new(phone_number_params)
   
    if @phone_number.save
      redirect_to @phone_number.contact, notice: 'Phone number was successfully created.'
    else
      render action: 'new'
    end
    
  end

  # PATCH/PUT /phone_numbers/1
  def update
    if @phone_number.update(phone_number_params)
      redirect_to @phone_number.contact, notice: 'Phone number was successfully updated!'
    else
      render action: 'edit'
    end
  end

  # DELETE /phone_numbers/1
  def destroy
    @phone_number.destroy
    redirect_to @phone_number.contact
    flash.notice = "Phone number was successfully deleted!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phone_number
      @phone_number = PhoneNumber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phone_number_params
      params.require(:phone_number).permit(:number, :contact_id, :contact_type)
    end
end
