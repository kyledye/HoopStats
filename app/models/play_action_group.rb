class PlayActionGroup < ApplicationRecord
  has_many :play_actions, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
