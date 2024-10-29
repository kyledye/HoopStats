class ShotGrade < ApplicationRecord
  has_many :plays, dependent: :nullify

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :made_multiplier, presence: true, numericality: true
  validates :missed_multiplier, presence: true, numericality: true
  validates :score, presence: true, numericality: { only_integer: true }
  validates :sort_order, presence: true, numericality: { only_integer: true }
end
