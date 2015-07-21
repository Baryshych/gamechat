class SessionsController < ApplicationController
  def new
  end

  def create
  session[:username] = params[:username]
  session[:password] = params[:password]
  render :html => "<p>Welcome, #{session[:username]}!</p>
  <li><a href=\"chatroom\">Enter chat</a></li>".html_safe
  end
end
