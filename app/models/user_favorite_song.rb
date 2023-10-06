# == Schema Information
#
# Table name: user_favorite_songs
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  song_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_user_favorite_songs_on_song_id  (song_id)
#  index_user_favorite_songs_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (song_id => songs.id)
#  fk_rails_...  (user_id => users.id)
#
class UserFavoriteSong < ApplicationRecord
  belongs_to :user
  belongs_to :song
  validates_uniqueness_of :song_id, scope: :user_id, presence: true
end
