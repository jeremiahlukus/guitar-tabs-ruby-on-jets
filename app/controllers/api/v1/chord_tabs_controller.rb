require "net/http"

class Api::V1::ChordTabsController < Api::BaseController
  skip_before_action :authenticate_api_token!, only: [:show, :index]
  def index
    url = URI.parse("https://raw.githubusercontent.com/T-vK/chord-collection/master/chords.json")
    req = Net::HTTP::Get.new(url.request_uri)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = (url.scheme == "https")
    response = http.request(req)
    hash = JSON.parse response.body
    hash.each do |name, values|
      puts name
      next if Chord.find_by(name: name)
      begin
        positions = values[0]["positions"]
        Chord.create(name: name, position: positions.join(" "))
      rescue
        next
      end
    end
    render json: {}, status: :no_content
  end

  # GET /refresh_songs
  def show
    begin
      render json: {tabs: Chord.find_by(name: params[:id]).position}
    rescue StandardError
      render json: {}, status: :not_found
    end

  end
end
