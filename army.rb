class Army
  attr_accessor :gold, :civilization, :units, :battles

  def initialize(civilization)
    @civilization = civilization
    @units = []
    @battles = []
    default_ammount
    setting
  end

  def total_points
    units.inject(0){ |sum,u| sum + u.current_points }
  end

  def greater_subtract_unit( quantity )
    #units.max_points(quantity).destroy
  end

  def attack( army )
    results = BattleManager.new(self, army).battle
    register_battle(results)
    army.register_battle(results)
  end

  def register_battle( battle )
    @battles << battle
  end

  def winner_battle
    @battles.inject(0){ |sum, b| sum + 1 if b.wars_won == self }
  end

  def loser_battle
    @battles.inject(0){ |sum, b| sum + 1 if b.wars_lost == self }
  end

  private

    def setting
      @civilization.unit_settings.each do |setting|
        (1..setting.unit_quantity).each do
          units << Unit.new(self, setting.unit_type)
        end
      end
    end

    def default_ammount
      @gold = 1000
    end
end
