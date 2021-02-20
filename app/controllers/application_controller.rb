class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
before_action :all_ordered_conversations
  before_action :opened_conversations_windows
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :set_user_data
  def opened_conversations_windows
  if user_signed_in?
    # opened conversations
    session[:private_conversations] ||= []
    session[:group_conversations] ||= []
    @private_conversations_windows = Private::Conversation.includes(:recipient, :messages)
                                         .find(session[:private_conversations])
    @group_conversations_windows = Group::Conversation.find(session[:group_conversations])
  else
    @private_conversations_windows = []
    @group_conversations_windows = []
  end
end
  def all_ordered_conversations
    if user_signed_in?
      @all_conversations = OrderConversationsService.new({user: current_user}).call
    end
  end

  protected

  def configure_permitted_parameters

devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
devise_parameter_sanitizer.permit(:account_update,keys: [:name])
end

private
def set_user_data
  if user_signed_in?
    gon.group_conversations = current_user.group_conversations.ids
    gon.user_id = current_user.id
    cookies[:user_id] = current_user.id if current_user.present?
    cookies[:group_conversations] = current_user.group_conversations.ids
  else
    gon.group_conversations = []
  end
end
end
