class Play < ApplicationRecord
  belongs_to :game
  belongs_to :period
  belongs_to :team
  belongs_to :play_action
  belongs_to :player, optional: true
  belongs_to :foul, optional: true
  belongs_to :shot_grade, optional: true
  belongs_to :shot_type, optional: true

  validates :game_clock, numericality: { only_integer: true }, allow_nil: true
  validates :sort_order, presence: true, numericality: { only_integer: true }

  validates :x_coordinate, numericality: true, allow_nil: true
  validates :y_coordinate, numericality: true, allow_nil: true
  validates :canvas_height, numericality: true, allow_nil: true
  validates :canvas_width, numericality: true, allow_nil: true
end
