class MypagesController < ApplicationController

  def index
  end

  def show
  end

  def edit_address
  end

  def update
   if current_user.update(user_params)
     redirect_to user_path(current_user)
   else
     redirect_to edit_user_path(current_user)
   end
  end
  
end