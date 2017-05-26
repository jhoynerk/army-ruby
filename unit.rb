class Unit
  attr_accessor :level_training, :current_points, :unit_type, :army

  def initialize(army, unit_type)
    @unit_type = unit_type
    @army = army
    @level_training = 0
    calculate_points
  end


#  scope :total_points {}
#  scope :max_points -> (quantity) {}


  def sum_level(level)
    self.level_training += level
    save
  end

  def calculate_points
    self.current_points = @unit_type.points + ( @unit_type.training_points * level_training )
  end
end
