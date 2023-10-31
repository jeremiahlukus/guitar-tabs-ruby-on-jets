class Api::V1::UserFavoriteSongsController < Api::BaseController
  #after_action { pagy_headers_merge(@pagy) if @pagy }
  before_action :set_song, only: [:show, :destroy]

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET /user_favorite_songs
  def index
    @user_favorite_songs = UserFavoriteSong.where(user_id: current_user.id)
    @pagy, @songs = pagy(Song.where(id: @user_favorite_songs.pluck(:song_id)).order(created_at: "asc"))
    pagy_headers_merge(@pagy)
    render json: @songs
  end

  def show
    if UserFavoriteSong.where(song_id: @song.id, user: current_user).present?
      render json: {is_favorite: true, song_id: @song.id.to_s}
    else
      render json: {is_favorite: false, song_id: @song.id.to_s}
    end
  end

  def update
    if current_user.user_favorite_songs.find_by(song_id: params[:id]).present?
      render json: {}, status: :no_content
    else
      @user_favorite_song = UserFavoriteSong.new(user: current_user, song_id: params[:id])
      if @user_favorite_song.save
        render json: {status: :created, location: @user_favorite_song}
      else
        render json: @user_favorite_song.errors, status: :unprocessable_entity
      end
    end
  end

  # POST /user_favorite_songs or /user_favorite_songs.json
  def create
    if current_user.user_favorite_songs.find_by(song_id: params[:song_id]).present?
      render json: {}, status: :no_content
    else
      @user_favorite_song = UserFavoriteSong.new(user: current_user, song_id: params[:id])

      # Uncomment to authorize with Pundit
      # authorize @user_favorite_song

      if @user_favorite_song.save
        render json: {status: :created, location: @user_favorite_song}
      else
        render json: @user_favorite_song.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /user_favorite_songs/1 or /user_favorite_songs/1.json
  def delete
    current_user.user_favorite_songs.find_by(song_id: params[:id]).destroy
    render json: {}, status: :no_content
  end

  private

  def set_fav_song
    @fav_song = UserFavoriteSong.find(params[:id])
  end

  def set_song
    @song = Song.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_favorite_song_params
    params.require(:user_favorite_song).permit(:song_id)

    # Uncomment to use Pundit permitted attributes
    # params.require(:user_favorite_song).permit(policy(@user_favorite_song).permitted_attributes)
  end
end
