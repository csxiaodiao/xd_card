# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, only: :wechat

  def wechat
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.wechat_data"] = request.env["omniauth.auth"].except(:extra)
      redirect_to root_path
    end
  end

  def failure
    redirect_to root_path
  end
end
