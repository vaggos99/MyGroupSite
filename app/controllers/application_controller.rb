class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :opened_conversations_windows
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  def opened_conversations_windows
    if user_signed_in?
      # opened conversations
      session[:private_conversations] ||= []
      @private_conversations_windows = Private::Conversation.includes(:recipient, :messages)
                                        .find(session[:private_conversations])
    else
      @private_conversations_windows = []
    end
  end


  protected

  def configure_permitted_parameters

devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
devise_parameter_sanitizer.permit(:account_update,keys: [:name])
end

end
