module NavigationHelper

  # return a conversation header partial's path
  def conversation_header_partial_path(conversation)
    if conversation.class == Private::Conversation
      'layouts/navigation/header/dropdowns/conversations/private'
    else
      'layouts/navigation/header/dropdowns/conversations/group'
    end
  end
end
