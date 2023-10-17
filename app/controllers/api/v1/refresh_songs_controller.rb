require "net/http"

class Api::V1::RefreshSongsController < Api::BaseController
  skip_before_action :authenticate_api_token!, only: [:index]

  # Song.all.each do |song|
  # url =

  # GET /refresh_songs
  def index
    url = URI.parse("https://songbase.life/api/v2/app_data")
    req = Net::HTTP::Get.new(url.request_uri)
    req.set_form_data({"name" => "Sur Max", "email" => "some@email.com"})
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = (url.scheme == "https")
    response = http.request(req)
    hash = JSON.parse response.body
    hash["songs"].each do |song|
      next if Song.find_by(song_base_id: song["id"]).present?
      puts "creating song"
      puts song["title"]
      Song.create(song_base_id: song["id"], lyrics: song["lyrics"], title: song["title"], language: song["lang"], song_number: 0)
    end
    # some songs have [] this breaks the app
    Song.all.each do |song|
      song.lyrics = song.lyrics.gsub("[]", "")
      song.save!
    end
    #Song.reindex!

    # hash["books"].each do |book|
    #   Playlist.create(song_base_id: book["id"], language: book["lang"], name: book["name"])
    #   book["songs"].each do |key, value|
    #     song = Song.find_by(song_base_id: key)
    #     song.song_number = value
    #     song.save
    #     PlaylistSong.create(song_base_id: key, playlist: Playlist.find_by(song_base_id: book["id"]), song: Song.find_by(song_base_id: key))
    #   end
    # end
    # hash["references"].each do |ref|
    #   next if PlaylistSong.find_by(song_base_id: ref["id"]).present?
    #   PlaylistSong.create(song_base_id: ref["id"], playlist: Playlist.find_by(song_base_id: ref["book_id"]), song: Song.find_by(song_base_id: ref["song_id"]))
    # end

    render json: {}, status: :no_content
  end
end
