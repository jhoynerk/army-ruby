class UnitTrainer

  def initialize(army)
    @manager = GoldManager.new(army)
  end

  def training(unit)
    @unit = unit
    @unit_type = unit.unit_type
    train_unit
  end

  def train_unit
    if @manager.available?(@unit_type.training_cost)
      @unit.sum_level(1)
      @manager.subtract(@unit_type.training_cost)
    end
  end
end
