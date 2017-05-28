class ArmyManager

  CHINESES = 'chineses'
  ENGLISHS = 'englishs'
  BYZANTINES = 'byzantines'
  PIKEMAN = 'pikeman'
  ARCHER = 'archer'
  KNIGHT = 'knight'

  UNIT_OPTION = {
                  "#{ArmyManager::KNIGHT}": { points: 20, training_points: 10, training_cost:  30, transformation_cost: nil, transformation: nil },
                  "#{ArmyManager::ARCHER}": { points: 10, training_points: 7, training_cost:  20, transformation_cost: 40, transformation: ArmyManager::KNIGHT },
                  "#{ArmyManager::PIKEMAN}": { points: 5, training_points: 3, training_cost: 10, transformation_cost: 30, transformation: ArmyManager::ARCHER }
                }

  UNIT_DEFAULTS =
                {
                  "#{ArmyManager::CHINESES}": { "#{ArmyManager::PIKEMAN}": 2, "#{ArmyManager::ARCHER}": 25, "#{ArmyManager::KNIGHT}": 2 },
                  "#{ArmyManager::ENGLISHS}": { "#{ArmyManager::PIKEMAN}": 10, "#{ArmyManager::ARCHER}": 10, "#{ArmyManager::KNIGHT}": 10 },
                  "#{ArmyManager::BYZANTINES}": { "#{ArmyManager::PIKEMAN}": 5, "#{ArmyManager::ARCHER}": 8, "#{ArmyManager::KNIGHT}": 15 }
                }


  def initialize
    @array_unit_types = {}
    ArmyManager::UNIT_OPTION.each do |key, v|
      @array_unit_types[key] = UnitType.new( key, v[:points], v[:training_points], v[:training_cost], v[:transformation_cost], verify_transformation(v) )
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

    def verify_transformation(v)
      ( v[:transformation].nil? ) ? nil : @array_unit_types[v[:transformation].to_sym]
    end
end
