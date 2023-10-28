class Admin::SongsController < AdminController
  before_action :set_song, only: [:show, :edit, :destroy, :switch]

  def index
    if params['query'].present?
      @songs = Song.full_text_search_for(params['query'])
    else
      @songs = Song.all
    end
  end

  # GET /accounts/1
  def show
  end

  def create
  end

  def update
    @song = Song.find(params[:song][:id])
    @song.update(song_params)
    redirect_to admin_songs_show_path(params[:song][:id])
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

