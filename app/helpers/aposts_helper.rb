module ApostsHelper
  def contact_user_partial_path
  if user_signed_in?
    @apost.user_id != current_user.id ? 'aposts/show/contact_user' : 'shared/empty_partial'
  else
    'aposts/show/login_required'
  end
end
def leave_message_partial_path
  if @message_has_been_sent
    'aposts/show/contact_user/already_in_touch'
  else
    'aposts/show/contact_user/message_form'
  end
end

end
