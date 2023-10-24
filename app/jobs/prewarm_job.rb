class PrewarmJob < ApplicationJob
  class_timeout 10
  class_memory 512
  rate '5 minutes'
  def hot_page
    functions = [
      "guitar-dev-revise_auth-registrations_controller-new",
      "guitar-dev-revise_auth-registrations_controller-create",
      "guitar-dev-revise_auth-sessions_controller-new",
      "guitar-dev-revise_auth-sessions_controller-create",
      "guitar-dev-revise_auth-sessions_controller-destroy",
      "guitar-dev-api-v1-songs_controller-index",
      "guitar-dev-api-v1-user_favorite_songs_controller-delete",
      "guitar-dev-api-v1-playlist_songs_controller-show",
      "guitar-dev-api-v1-user_favorite_songs_controller-show",
      "guitar-dev-api-v1-user_favorite_songs_controller-create",
      "guitar-dev-api-v1-user_favorite_songs_controller-update",
      "guitar-dev-api-v1-user_favorite_songs_controller-index",
      "guitar-dev-api-v1-songs_controller-show",
      "guitar-dev-api-v1-chord_tabs_controller-show",
      "guitar-dev-api-v1-auths_controller-delete"
    ]

    functions.each do |function_name|
      threads = []
      10.times do
        threads << Thread.new do
          Jets::Preheat.warm(function_name)
        end
      end
      threads.each { |t| t.join }
      "Finished prewarming #{function_name}."
    end
  end
end
