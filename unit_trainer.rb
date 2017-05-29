class UnitTrainer < UnitTool

  def process_unit
    if @manager.available?(@unit_type.training_cost)
      @unit.sum_level(1)
      @manager.subtract(@unit_type.training_cost)
    end
  end
end
