# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, only: :wechat

  def wechat
    logger.info auth_hash

    if auth_hash.uid.blank?
      return redirect_to root_path, alert: '微信OAuth2.0登录失败！'
    end
    @user = User.from_omniauth(auth_hash)

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.wechat_data"] = auth_hash
      redirect_to root_path, alert: '微信OAuth2.0登录失败！'
    end
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
