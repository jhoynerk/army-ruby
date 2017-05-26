class Battle

  attr_accessor :winner_army, :loser_army, :date

  def initialize(winner, loser)
    @winner_army = winner
    @loser_army = loser
  end
end
