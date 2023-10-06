class Api::V1::SongsController < Api::BaseController
  before_action :set_song, only: [:show]
  #after_action { pagy_headers_merge(@pagy) if @pagy }

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET /songs?page=1
  def index
    if params['query'].present?
      songs = Song.full_text_search_for(params['query'])
    else
      songs = Song.all
    end
    @pagy, @songs = pagy(songs)
    pagy_headers_merge(@pagy)
    render json: @songs
  end

  # GET /songs/1 or /songs/1.json
  def show
    if current_user.user_favorite_songs.pluck(:song_id).include? @song.id
      render json: {is_favorite: true, song_id: @song.id}
    else
      render json: {is_favorite: false, song_id: @song.id}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_song
    @song = Song.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @song
  end

  # Only allow a list of trusted parameters through.
  def song_params
    params.fetch(:song).permit(:query, :filter)

    # Uncomment to use Pundit permitted attributes
    # params.require(:song).permit(policy(@song).permitted_attributes)
  end
end
