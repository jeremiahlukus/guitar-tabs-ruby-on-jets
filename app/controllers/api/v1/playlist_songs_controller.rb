class Api::V1::PlaylistSongsController < Api::BaseController
  #after_action { pagy_headers_merge(@pagy) if @pagy }

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET /playlist_songs/1 or /playlist_songs/1.json
  def show
    #binding.pry
    @playlist = Playlist.find_by(name: params[:id])
    @playlist_songs = PlaylistSong.where(playlist: @playlist)
    @pagy, @songs = pagy(Song.where(id: @playlist_songs.pluck(:song_id)).order(song_number: "asc"))
    pagy_headers_merge(@pagy)
    render json: @songs
  end

  # POST /playlist_songs or /playlist_songs.json
  def create
    @playlist_song = PlaylistSong.new(playlist_song_params)

    if @playlist_song.save
      render json: {status: :created, location: @playlist_song}
    else
      render json: @playlist_song.errors, status: :unprocessable_entity
    end
  end

  # DELETE /playlist_songs/1 or /playlist_songs/1.json
  def destroy
    PlaylistSong.where(song_id: params[:song_id], playlist_id: params[:playlist_id]).destroy_all
    head :no_content
  end

  private

  # Only allow a list of trusted parameters through.
  def playlist_song_params
    params.fetch(:playlist_song).permit(:song_id, :playlist_id)

    # Uncomment to use Pundit permitted attributes
    # params.require(:playlist_song).permit(policy(@playlist_song).permitted_attributes)
  end
end
