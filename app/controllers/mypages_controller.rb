class MypagesController < ApplicationController

  def index
  end

  def show
  end

  def update
   if current_user.update(user_params)
     redirect_to user_path(current_user)
   else
     redirect_to edit_user_path(current_user)
   end
  end

  private

  def address_params
    params.permit(:address_first_name, :faddress_family_name, :address_first_name_kana, :faddress_family_name_kana, :post_code, :prefecture_id, :city, :address_line, :building_name, :phone)
  end
  
end