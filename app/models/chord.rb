# == Schema Information
#
# Table name: chords
#
#  id         :bigint           not null, primary key
#  name       :string
#  position   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Chord < ApplicationRecord
end
