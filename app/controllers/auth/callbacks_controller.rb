class Auth::CallbacksController < ApplicationController
  
  def facebook
    user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in_and_redirect user, event: :authentication if user.persisted?
  end

 
end