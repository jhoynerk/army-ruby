class Army
  attr_accessor :gold, :civilization, :units, :battles
  DEFAULT_GOLD = 1000

  def initialize(civilization)
    @civilization = civilization
    @units = []
    @battles = []
    @gold = Army::DEFAULT_GOLD
    setting
  end

  def total_points
    units.inject(0){ |sum,u| sum + u.current_points }
  end

  def greater_subtract_unit( quantity )
    (1..quantity).each do |q|
      destroy_unit
    end
  end

  def attack( army )
    results = BattleManager.new(self, army).war.results_battle
    register_battle(results)
    army.register_battle(results)
  end

  def register_battle( battle )
    @battles << battle
  end

  def winner_battle
    @battles.inject(0){ |sum, b| (b.wars_won == self) ? sum + 1 : sum }
  end

  def loser_battle
    @battles.inject(0){ |sum, b| (b.wars_lost == self) ? sum + 1 : sum }
  end

  def find_unit(unit_type)
    result = nil
    @units.each do |unit|
      if unit.unit_type.name.to_s ==  unit_type
        return unit
      end
    end
    result
  end

  private

    def destroy_unit
      unit = @units.max_by do |element|
        element.current_points
      end
      @units.delete(unit)
    end

    def setting
      @civilization.unit_settings.each do |setting|
        (1..setting.unit_quantity).each do
          units << Unit.new(self, setting.unit_type)
        end
      end
    end
end
