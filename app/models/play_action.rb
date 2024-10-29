class PlayAction < ApplicationRecord
  belongs_to :play_action_group
  has_many :plays, dependent: :nullify

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :points, presence: true, numericality: { only_integer: true }

  default_scope { where(active: true).order(sort_order: :asc, name: :asc) }
end
