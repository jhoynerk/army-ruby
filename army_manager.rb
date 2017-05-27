class ArmyManager

  UNIT_OPTION = {
                  piquero: { points: 5, training_points: 3, training_cost: 10 },
                  arquero: { points: 10, training_points: 7, training_cost:  20 },
                  caballero: { points: 20, training_points: 10, training_cost:  30 }
                }

  UNIT_DEFAULTS =
                {
                  chinos: { piquero: 2, arquero: 25, caballero: 2 },
                  ingleses: { piquero: 10, arquero: 10, caballero: 10 },
                  bizantinos: { piquero: 5, arquero: 8, caballero: 15 }
                }


  def initialize
    @array_unit_types = {}
    ArmyManager::UNIT_OPTION.each do |key, v|
      @array_unit_types[key] = UnitType.new( key.to_s, v[:points], v[:training_points], v[:training_cost] )
    end
  end

  def create_chinese
    civilization = 'chinos'
    create_army(civilization)
  end

  def create_english
    civilization = 'ingleses'
    create_army(civilization)
  end

  def create_byzantine
    civilization = 'bizantinos'
    create_army(civilization)
  end

  private
    def settings(civilization)
      ArmyManager::UNIT_DEFAULTS[civilization.to_sym].map { |k, count| UnitSetting.new(count, @array_unit_types[k] ) }
    end

    def create_army(civilization)
      Army.new(create_civilization(civilization))
    end

    def create_civilization(civilization)
      Civilization.new( civilization , settings(civilization))
    end
end
