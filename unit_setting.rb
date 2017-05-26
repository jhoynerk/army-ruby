class UnitSetting
  attr_accessor :unit_quantity, :unit_type

  def initialize(unit_quantity, unit_type)
    @unit_quantity = unit_quantity
    @unit_type = unit_type
  end
end
