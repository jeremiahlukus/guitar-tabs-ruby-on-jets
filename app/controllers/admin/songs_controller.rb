class Admin::SongsController < AdminController
  before_action :set_song, only: [:show, :edit, :destroy, :switch]

  def index
    @songs = Song.all
  end

  # GET /accounts/1
  def show
  end

  def create
  end

  def update
    @song = Song.find(params[:song][:id])
    @user.update(song_params)
    redirect_back(fallback_location: root_path)
  end


  # GET /accounts/new
  def new
    @song= Song.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # DELETE /accounts/1
  def delete
  end


  private

  def song_params
    params.require(:song).permit(:title, :lyrics, :url)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_song
    @song= Song.find(params[:id])
  end
end

