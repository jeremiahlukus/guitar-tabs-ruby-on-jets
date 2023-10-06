require 'revise_auth-jets'
class ReviseAuthController < ApplicationController
  # Return true if it's a revise_auth_controller. false to all controllers unless
  # the controllers defined inside revise_auth. Useful if you want to apply a before
  # filter to all controllers, except the ones in revise_auth:
  #
  #   before_action :authenticate_user!, except: :revise_auth_controller?
  include ReviseAuth::Authentication

  def after_sign_in_path_for
    callback_path + "?state=#{current_user.api_tokens.first_or_create(name: ApiToken::APP_NAME).token}"
  end

  def revise_auth_controller
    is_a?(::ReviseAuthController)
  end
end
