require 'navigation_helper.rb'
module ApplicationHelper
    include ApostsHelper
    include Private::ConversationsHelper
    include Private::MessagesHelper
    include NavigationHelper
end
