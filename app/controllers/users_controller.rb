class UsersController < ApplicationController
  before_action :set_address, only: [:edit_address, :update_address]

  def edit
  end

  def new
  end

  def update_address
    @address.update(address_params)
  end

  private

  def address_params
    params.require(:address).permit(:address_first_name, :faddress_family_name, :address_first_name_kana, :faddress_family_name_kana, :post_code, :prefecture_id, :city, :address_line, :building_name, :phone)
  end


end
