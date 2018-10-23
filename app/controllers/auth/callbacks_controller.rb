class Auth::CallbacksController < ApplicationController
  
  def facebook
    user = User.create_from_provider_data(request.env['omniauth.auth'])
     if user.persisted? 
      sign_in_and_redirect user
    else
      failure
    end
  end

  def failure
  	flash[:error] = 'There was a problem signing you in. Please register or try signing in later.' 
    redirect_to new_user_registration_url
  end
 
end