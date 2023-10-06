class Api::V1::MesController < Api::BaseController
  def show
    render json: current_user
  end

  def delete
    current_user.destroy
    logout
    render json: {}
  end
end
