class Foul < ApplicationRecord
  has_many :plays, dependent: :nullify

  validates :name, presence: true
end
