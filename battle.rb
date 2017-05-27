class Battle

  attr_accessor :winner_army, :loser_army, :datetime

  def initialize(winner, loser)
    @winner_army = winner
    @loser_army = loser
    @datetime = Time.now
  end
end
