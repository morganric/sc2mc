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

   def shopify
    user = User.find_for_oauth(request.env["omniauth.auth"], current_user)

    user.save

    if user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Shopify"
      sign_in_and_redirect user, :event => :authentication
    else
      session["devise.shopify_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end

  end


  def mixcloud

    # user = User.find_for_oauth(request.env["omniauth.auth"], current_user)

    # user.save

    # if user.persisted?
    #       debugger
    #   flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Mixcloud"
    #   sign_in_and_redirect user, :event => :authentication
    # else
    #   session["devise.mixcloud_data"] = request.env["omniauth.auth"]
    #   redirect_to new_user_registration_url
    # end

    @mixcloud_code = params[:code]


    require 'open-uri'
    require 'json'

    mixcloud_oauth_url = "https://www.mixcloud.com/oauth/access_token?client_id=wpLF5wDyDUQYQJnrFY&redirect_uri=#{user_omniauth_callback_url(:mixcloud)}&client_secret=bwmCybqTBpAawF26yk4pxANwBC8MHYbp&code=#{@mixcloud_code}"

    @result = JSON.parse(open(mixcloud_oauth_url).read)

    @mixcloud_access_token = @result["access_token"]
    current_user.mixcloud_access_token = @mixcloud_access_token

    current_user.save

  end

  def failure

      @mixcloud_code = params[:code]


      require 'open-uri'
      require 'json'

      mixcloud_oauth_url = "https://www.mixcloud.com/oauth/access_token?client_id=wpLF5wDyDUQYQJnrFY&redirect_uri=#{user_omniauth_callback_url(:mixcloud)}&client_secret=bwmCybqTBpAawF26yk4pxANwBC8MHYbp&code=#{@mixcloud_code}"

      @result = JSON.parse(open(mixcloud_oauth_url).read)

      @mixcloud_access_token = @result["access_token"]
      current_user.mixcloud_access_token = @mixcloud_access_token

      current_user.save

      #handle your logic here..
    

      #and delegate to super.
      super
   end


private
    # Using a private method to encapsulate the permissible parameters is just a good pattern
    # since you'll be able to reuse the same permit list between create and update. Also, you
    # can specialize this method with per-user checking of permissible attributes.
def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation, :remember_me, :provider, :uid, :access_token, :mixcloud_access_token)
end

end