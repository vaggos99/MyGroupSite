class InvitationsController < ApplicationController

def new
end
  def create

    @invitation = Invitation.create(invitation_params)
    redirect_to users_path
  end
def my_invitations
    @invitation=Invitation.notReacted(current_user.id)

end
def update
@invitation = Invitation.find(params[:id])
@invitation.update(confirmed: :true)
redirect_to root_path
end
def show
  @invitation = Invitation.find(params[:id])
  @invitation.destroy
  redirect_to root_path
end
def destroy
@invitation = Invitation.find(params[:id])
@invitation.destroy
redirect_to root_path
end
  private

  def invitation_params
    params.require(:invitation).permit(:user_id, :friend_id,:confirmed)
  end
end
