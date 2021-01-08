class UsersController < ApplicationController

  def my_friends

    @users=User.friends(current_user.id)
  end


  def index
   @users = User.all
   if !params[:search].blank?
       @users=@users.where("name LIKE ? ","%"+params[:searchuser]+"%")
end
end


 private

 def user_params
    params.require(:user).permit(:id,:name,:id,:email,:password,:searchuser)
  end

end
