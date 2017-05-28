class UnitTransformation
  def initialize(army)
    @manager = MoneyManager.new(army)
  end

  def transformation(unit)
    @unit = unit
    @unit_type = unit.unit_type
    transformation_unit unless @unit_type.transformation
  end

  def transformation_unit
    if @manager.available?(@unit_type.transformation_cost)
      @unit.unit_type = @unit_type.transformation
      @manager.subtract(@unit_type.training_cost)
    end
  end
end
