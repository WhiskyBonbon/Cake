class Customer::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = Address.new(@address)
    @address.save
    redirect_to addresses_path
  end

  def edit

  end

  def destroy

  end

  def update

  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end




end
