class Admin::SongsController < AdminController
  before_action :set_song, only: [:show, :edit, :destroy, :switch]
  after_action :set_header, only: [:update]

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
    begin
      @song = Song.find(params[:song][:id])
      @song.update(song_params)
       render :index, status: :ok
    rescue StandardError => e
      Sentry.capture_message("error #{e}")
    end
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
  def set_header
    response.set_header['x-csrf-token'] = params['authenticity_token']
  end

  def song_params
    params.require(:song).permit(:title, :lyrics, :url)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_song
    @song= Song.find(params[:id])
  end
end

