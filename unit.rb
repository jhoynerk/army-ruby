class Unit < ActiveRecord::Base
  belongs_to :type_unit
  belongs_to :army

  before_save :calculate_points

  scope :total_points {}
  scope :max_points -> (quantity) {}

  attr_accessor :level_training, :current_points

  def sum_level(level)
    self.level_training += level
    save
  end

  def calculate_points
    self.current_points = type_unit.points + ( type_unit.training_points * level_training )
  end
end
