class UsersController < ApplicationController
  def index
   @users = User.all
   if !params[:search].blank?
       @users=@users.where("name LIKE ? ","%"+params[:searchuser]+"%")
end
end

def my_friends

  @user=User.friends(current_user.id)
end
 private

 def user_params
    params.require(:user).permit(:name,:id,:email,:password,:searchuser)
  end

end
