class ShotType < ApplicationRecord
  has_many :plays, dependent: :nullify

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :sort_order, presence: true, numericality: { only_integer: true }
end
