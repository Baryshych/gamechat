class ChatsController < ApplicationController

 before_filter :authenticate_user!


def room
  redirect_to sign_up_path unless user_signed_in?
end

def new_message
  # Check if the message is private
  if recipient = params[:message].match(/@(\w+) (.+)/)
    # It is private, send it to the recipient's private channel
    @channel = "/messages/private/#{recipient.captures.first}"
    @message = { :username => current_user.username, :msg => recipient.captures.second }
  else
    # It's public, so send it to the public channel
    @channel = "/messages/public"
    @message = { :username => current_user.username, :msg => params[:message] }
  end
  respond_to do |f|
    f.js
  end
end

end
