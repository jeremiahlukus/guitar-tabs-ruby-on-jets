class MainController < ReviseAuthController
  before_action :authenticate_user!, only: [:authenticated, :index]

  def index
  end

  def authenticated
  end
end
