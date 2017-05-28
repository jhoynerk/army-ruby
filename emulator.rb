class Emulator

  def initialize

  end

  def print_screen(army)
    p "#"*40
    p "Nombre de la civilización: #{army.civilization.name}"
    p "Puntos: #{army.total_points}"
    p "Oro: #{army.gold}"
    p "Victorias: #{army.winner_battle.to_s}"
    p "Derrotas: #{army.loser_battle.to_s}"
    p "Numero de unidades: #{army.units.count}"
    print_space
  end

  def print_space
    (1..5).each { p "#"*40 }
  end

end
