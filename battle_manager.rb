class BattleManager
  GOLD = 100

  def initialize(attacker, defender)
    @attacker = attacker
    @defender = defender
    war
  end

  def battle
    @results_battle
  end

  private
    def war
      if winner?
        results_battle(@attacker, @defender)
      elsif loser?
        results_battle(@defender, @attacker)
      elsif draw?
        subtract_unit(@attacker, rand(0..2))
        subtract_unit(@defender, rand(0..2))
        sum_money_army(@attacker, rand(10..50))
        sum_money_army(@defender, rand(10..50))
        @results_battle = Battle.new( @attacker, @defender, true)
      end
    end

    def results_battle(winner, loser)
      @results_battle = Battle.new( winner, loser)
      sum_money_army(winner)
      subtract_unit(loser)
    end

    def sum_money_army(army, gold = BattleManager::GOLD)
      GoldManager.new(army).sum(gold)
    end

    def subtract_unit(army, count = 2)
      army.greater_subtract_unit(count)
    end

    def winner?
      (@attacker.total_points > @defender.total_points)
    end

    def loser?
      (@attacker.total_points < @defender.total_points)
    end

    def draw?
      (@attacker.total_points == @defender.total_points)
    end
end
