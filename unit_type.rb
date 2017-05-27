class UnitType
  attr_accessor :name, :points, :training_points, :training_cost, :units, :civilization

  def initialize(name, points, training_points, training_cost)
    @name = name
    @points = points
    @training_cost = training_cost
    @training_points = training_points
  end

  def add_unit(unit)
    @units << unit
  end

  def remove_unit(unit)
    @units.drop(unit)
  end

  def civilization(civilization)
    @civilization = civilization
  end

end
