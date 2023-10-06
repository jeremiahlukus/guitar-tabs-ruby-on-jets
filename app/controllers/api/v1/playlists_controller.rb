class Api::V1::PlaylistsController < Api::BaseController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET /playlists
  def index
    @playlists = Playlist.all
    render json: @playlists
    # Uncomment to authorize with Pundit
    # authorize @playlists
  end

  # POST /playlists or /playlists.json
  def create
    @playlist = Playlist.new(playlist_params)

    # Uncomment to authorize with Pundit
    # authorize @user_favorite_song

    if @playlist.save
      render json: {status: :created, location: @playlist}
    else
      render json: @playlist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /playlists/1 or /playlists/1.json
  def update
    if @playlist.update(playlist_params)
      render json: {status: :created, location: @playlist}
    else
      render json: @playlist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /playlists/1 or /playlists/1.json
  def delete
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to playlists_url, notice: "Playlist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_playlist
    @playlist = Playlist.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @playlist
  end

  # Only allow a list of trusted parameters through.
  def playlist_params
    params.fetch(:playlist).permit(:name)

    # Uncomment to use Pundit permitted attributes
    # params.require(:playlist).permit(policy(@playlist).permitted_attributes)
  end
end
