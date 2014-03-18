class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def soundcloud
    user = User.find_for_oauth(request.env["omniauth.auth"], current_user)

    user.save

    if user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Soundcloud"
      sign_in_and_redirect user, :event => :authentication
    else
      session["devise.soundcloud_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end

  end

   def mixcloud
    user = User.find_for_oauth(request.env["omniauth.auth"], current_user)

    user.save

    debugger

    if user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Soundcloud"
      sign_in_and_redirect user, :event => :authentication
    else
      session["devise.soundcloud_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end

  end




private
    # Using a private method to encapsulate the permissible parameters is just a good pattern
    # since you'll be able to reuse the same permit list between create and update. Also, you
    # can specialize this method with per-user checking of permissible attributes.
def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation, :remember_me, :provider, :uid, :access_token)
end

end