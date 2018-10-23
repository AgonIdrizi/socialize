class Auth::CallbacksController < ApplicationController
  
  def facebook
    User.set_param(request.env['omniauth.auth'])
    user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in_and_redirect user, event: :authentication if user.persisted?
  end

 
end