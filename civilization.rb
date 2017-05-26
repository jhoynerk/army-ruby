class Civilization
  attr_accessor :name, :unit_settings, :armies

  def initialize(name, unit_settings, armies = nil)
    @name = name
    @unit_settings = unit_settings
    @armies = armies
  end

end
