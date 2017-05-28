class Emulator

  SELECT_OPTION = { 1 => 'chinese', 2 => 'english', 3 => 'byzantine' }

  attr_accessor :my_army, :armies

  def initialize
    @armies = []
  end

  def select_your_civilization
    message = 'Seleccionar tu civilización'
    @my_army = print_question(message)
  end

  def select_attack_civilization
    message = 'Que civilización quieres atacar?'
    @armies << print_question(message)
  end

  def print_question(message)
    p message
    p Emulator::SELECT_OPTION
    option = gets.chomp
    ArmyManager.new.send("create_#{Emulator::SELECT_OPTION[option.to_i]}")
  end

  def print_screen(army = @my_army)
    p "#"*40
    p "Nombre de la civilización: #{army.civilization.name}"
    p "Puntos: #{army.total_points}"
    p "Oro: #{army.gold}"
    p "Victorias: #{army.winner_battle.to_s}"
    p "Derrotas: #{army.loser_battle.to_s}"
    p "Numero de unidades: #{army.units.count}"
    print_space
    self
  end

  def print_space
    (1..2).each { p "#"*40 }
  end

end
