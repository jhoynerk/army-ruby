class UnitTransformation
  def initialize(army)
    @manager = GoldManager.new(army)
  end

  def transformation(unit)
    @unit = unit
    @unit_type = unit.unit_type
    transformation_unit
    return @unit
  end

  def transformation_unit
    if @manager.available?(@unit_type.transformation_cost)
      @unit.unit_transformation(@unit_type.transformation)
      @manager.subtract(@unit_type.transformation_cost)
    end
  end
end
