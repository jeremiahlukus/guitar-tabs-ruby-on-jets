class Api::V1::UsersController < Api::BaseController
  skip_before_action :authenticate_api_token!, only: [:create]
  before_action :configure_permitted_parameters, only: [:create]

  def create
    user = User.new(sign_up_params)
    if user.save
      api_token = user.api_tokens.first_or_create(name: ApiToken::DEFAULT_NAME)
      render json: {
        user: {
          id: user.id,
          email: user.email,
          name: user.name,
          api_tokens: [{
            id: api_token.id,
            name: api_token.name,
            token: api_token.token
          }]
        }
      }
    else
      render json: {
        errors: user.errors,
        error: user.errors.full_messages.to_sentence
      }, status: :unprocessable_entity
    end
  end

  private
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end


end
