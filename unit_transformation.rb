class UnitTransformation < UnitTool

  def process_unit
    if @manager.available?(@unit_type.transformation_cost)
      @unit.unit_transformation(@unit_type.transformation)
      @manager.subtract(@unit_type.transformation_cost)
    end
  end
end
