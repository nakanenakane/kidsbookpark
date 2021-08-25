class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    if @user.save
      session[:user_id] = @user.id
      session["devise.regist_data"] = {user: @user.attributes}
     redirect_to users_addresses_path
    else
      render "new"
    end
  end

  def new_address
    @address = Address.new
  end
  
  def create_address
    @user = User.new(session["devise.regist_data"]["user"])
    @address = Address.new(address_params)
    if @address.save
      sign_in(@user)
      redirect_to root_path
    else
      render "new_address"
    end
  end

  def update_address
    @address.update(address_params)
    redirect_to mypages_path(current_user)
  end

  def edit_address
    @address = Address.find(current_user[:id])
  end


private

  def address_params
    params.require(:address).permit(:address_family_name, :address_first_name, :address_family_name_kana, :address_first_name_kana, :prefecture_id, :post_code, :city, :address_line, :building_name, :phone).merge(user_id: session[:user_id])
  end
end
