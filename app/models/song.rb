# == Schema Information
#
# Table name: songs
#
#  id           :bigint           not null, primary key
#  artist       :string
#  category     :integer          default("general")
#  chords       :string
#  language     :string
#  lyrics       :string
#  song_number  :integer          not null
#  sub_category :integer
#  title        :string
#  url          :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  book_id      :integer
#  song_base_id :integer
#
class Song < ApplicationRecord
   #enum :category, [:general, :scripture_song, :hymn, :childrens], _suffix: true
  # enum :sub_category, [:scripture_song, :hymn, :childrens], prefix: :sub_cat

  has_many :playlist_songs, dependent: :destroy
  has_many :playlists, through: :playlist_songs

  include PgSearch::Model
  # pg_search_scope :search_full_text, against: {
  #   title: 'A',
  #   lyrics: 'B',
  #   song_number: 'C'
  # }

  multisearchable against: [:title, :lyrics, :song_number]
  scope :full_text_search_for, -> (term) do
    joins(:pg_search_document).merge(
      PgSearch.multisearch(term).where(searchable_type: klass.to_s)
    )
  end

  #pg_search_scope :search_full_text,
  #  against: { title: 'A', lyrics: 'B', song_number: 'C'},
  #  using: { tsearch: { dictionary: 'english', any_word: true } }
  # include MeiliSearch::Rails
  # extend Pagy::Meilisearch

  # meilisearch do
  #   searchable_attributes [:title, :lyrics, :song_number]
  #   sortable_attributes [:created_at, :updated_at]
  # end
end
