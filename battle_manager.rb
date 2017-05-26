class BattleManager
  GOLD = 100

  def initialize(attacker, defender)
    @attacker = attacker
    @defender = defender
  end

  def battle
    if winner?
      sum_money_army(@attacker)
      subtract_unit(@defender)
    elsif losser?
      sum_money_army(@defender)
      subtract_unit(@attacker)
    elsif draw?
      subtract_unit(@attacker, rand(0..2))
      subtract_unit(@attacker, rand(0..2))
      sum_money_army(@attacker, rand(10..50))
      sum_money_army(@defender, rand(10..50))
    end
  end

  private
    def sum_money_army(army, gold = BattleManager::GOLD)
      MoneyManager.new(army).sum(gold)
    end

    def subtract_unit(army, count = 2)
      army.greater_subtract_unit(count)
    end

    def winner?
      (@attacker.total_points > @defender.total_points)
    end

    def losser?
      (@attacker.total_points < @defender.total_points)
    end

    def draw?
      (@attacker.total_points == @defender.total_points)
    end
end
