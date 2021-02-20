class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
has_many :aposts
has_many :invitations
has_many :group_messages, class_name: 'Group::Message'
has_and_belongs_to_many :group_conversations, class_name: 'Group::Conversation'
devise :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :pending_invitations, -> { where confirmed: :false}, class_name: 'Invitation', foreign_key: "friend_id"
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
     unless user
         user = User.create(name: data['name'],
            email: data['email'],
            password: Devise.friendly_token[0,20]
         )
     end
    user
end
  def self.friends(id)
    friends_i_sent_invitation = Invitation.where(user_id: id, confirmed: true).pluck(:friend_id)
  friends_i_got_invitation = Invitation.where(friend_id: id, confirmed: true).pluck(:user_id)
  ids = friends_i_sent_invitation + friends_i_got_invitation
  where(id: ids)
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
