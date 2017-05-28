class Emulator

  SELECT_OPTION = { 1 => 'chinese', 2 => 'english', 3 => 'byzantine' }
  SELECT_OPTION_UNIT = { 1 => 'pikeman', 2 => 'archer', 3 => 'knight' }

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

  def training
    unit = @my_army.units.last
    p "Se va a entrenar tu: #{unit.unit_type.name} con puntos #{unit.current_points} y nivel #{unit.level_training} por un costo de #{unit.unit_type.training_cost}"
    p "Tu oro: #{@my_army.gold}"
    UnitTrainer.new(@my_army).training(@my_army.units.last)
    p "Finalizo el entrenamiento: #{unit.unit_type.name} con puntos #{unit.current_points} y nivel #{unit.level_training} "
    p "Tu oro: #{@my_army.gold}"
  end

  def transformation
    begin
      p "Desea transformar una unidad?"
      p "1. Pikero a Arquero"
      p "2. Arquero a Caballero"
      p "3. No, seguir atacando"
      option = gets.chomp
      unit_type = Emulator::SELECT_OPTION_UNIT[option.to_i]
      unit = @my_army.find_unit(unit_type) if option != "3"
      unless unit.nil?
        p "Se va a transformar tu: #{unit.unit_type.name} con puntos #{unit.current_points} y nivel #{unit.level_training} por un costo de #{unit.unit_type.transformation_cost}"
        p "Tu oro: #{@my_army.gold}"
        unit = UnitTransformation.new(@my_army).transformation(unit)
        p "Se va a transformar tu: #{unit.unit_type.name} con puntos #{unit.current_points} y nivel #{unit.level_training}"
        p "Tu oro: #{@my_army.gold}"
      else
        p "No tienes mas #{Emulator::SELECT_OPTION_UNIT[option.to_i]}"
      end
      unit = nil
    end until option == "3"
  end

  def print_space
    (1..2).each { p "#"*40 }
  end

end
