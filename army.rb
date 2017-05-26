class Army
  attr_accessor :gold, :civilization, :units, :battles

  def initialize(civilization)
    @civilization = civilization
    @units = []
    default_ammount
    setting
  end

#  has_many :winner_battle, class_name: 'Battle', foreign_key: 'winner_id'
#  has_many :loser_battle, class_name: 'Battle', foreign_key: 'loser_id'

  def total_points
    units.inject(0){ |sum,u| sum + u.current_points }
  end

  def greater_subtract_unit(quantity)
    #units.max_points(quantity).destroy
  end

  def attack(army)
    BattleManager.new(self, army)
    register_battle(army)
  end

  private
    def register_battle(army, results_battle)
      # coding
    end

    def setting
      @civilization.unit_settings.each do |setting|
        (1..setting.unit_quantity).each do
          units << Unit.new(self, setting.unit_type)
        end
      end
    end

    def default_ammount
      self.gold = 1000
    end
end
