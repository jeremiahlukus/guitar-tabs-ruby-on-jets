require 'revise_auth-jets'
class User < ApplicationRecord
  include ReviseAuth::Model
  has_many :api_tokens, dependent: :destroy
  has_many :user_favorite_songs, dependent: :destroy
  has_many :songs, through: :user_favorite_songs
end
