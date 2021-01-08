class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
has_many :aposts
has_many :invitations
  has_many :pending_invitations, -> { where confirmed: "false" }, class_name: 'Invitation', foreign_key: "friend_id"
  def self.friends(id)
     where("id=(?) OR id=(?)", Invitation.where("user_id =? AND confirmed ='t'",id).select(:friend_id),
     Invitation.where("friend_id =? AND confirmed ='t'",id).select(:user_id))
   end

   def friend_with?(id1,id2)
     Invitation.confirmed_record?(id1, id2)
   end

   def sent_invitation?(id1,id2)
     Invitation.reacted?(id1, id2)
   end
   def send_invitation(user)
     invitations.create(friend_id: user.id)
   end
end
