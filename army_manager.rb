class ArmyManager

  CHINESES = 'chineses'
  ENGLISHS = 'englishs'
  BYZANTINES = 'byzantines'

  UNIT_OPTION = {
                  piquero: { points: 5, training_points: 3, training_cost: 10 },
                  arquero: { points: 10, training_points: 7, training_cost:  20 },
                  caballero: { points: 20, training_points: 10, training_cost:  30 }
                }

  UNIT_DEFAULTS =
                {
                  "#{ArmyManager::CHINESES}": { piquero: 2, arquero: 25, caballero: 2 },
                  "#{ArmyManager::ENGLISHS}": { piquero: 10, arquero: 10, caballero: 10 },
                  "#{ArmyManager::BYZANTINES}": { piquero: 5, arquero: 8, caballero: 15 }
                }


  def initialize
    @array_unit_types = {}
    ArmyManager::UNIT_OPTION.each do |key, v|
      @array_unit_types[key] = UnitType.new( key.to_s, v[:points], v[:training_points], v[:training_cost] )
    end
  end

  def create_chinese
    create_army(ArmyManager::CHINESES)
  end

  def create_english
    create_army(ArmyManager::ENGLISHS)
  end

  def create_byzantine
    create_army(ArmyManager::BYZANTINES)
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
