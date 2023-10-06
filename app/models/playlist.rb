# == Schema Information
#
# Table name: playlists
#
#  id           :bigint           not null, primary key
#  language     :string
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  song_base_id :integer
#
class Playlist < ApplicationRecord
  has_many :playlist_songs, dependent: :destroy
  has_many :songs, through: :playlist_songs

  validates_uniqueness_of :name, presence: true
end
