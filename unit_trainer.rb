class UnitTrainer

  def initialize(army)
    @manager = MoneyManager.new(army)
  end

  def training(unit)
    @unit = unit
    @type_unit = unit.type_unit
    train_unit
  end

  def train_unit
    if @manager.available?(@type_unit.training_cost)
      @unit.sum_level(1)
      @manager.subtract(@type_unit.training_cost)
    end
  end
end
