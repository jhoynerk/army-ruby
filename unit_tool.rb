class UnitTool

  def initialize(army)
    @manager = GoldManager.new(army)
  end

  def perform(unit)
    @unit = unit
    @unit_type = unit.unit_type
    process_unit
    return @unit
  end

end
