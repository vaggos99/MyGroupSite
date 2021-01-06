class InvitationsController < ApplicationController

def new
end
  def create
  @invitation = Invitation.new(invitation_params)
@invitation.save

  end
def show
    @invitation=Invitation.notReacted(current_user.id)

end
def update
@invitation = Invitation.find(params[:id])
@invitation.update(confirmed: true)
redirect_to root_path
end
  private

  def invitation_params
    params.require(:invitation).permit(:user_id, :friend_id,:confirmed)
  end
end
