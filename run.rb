require_relative 'army'
require_relative 'battle'
require_relative 'battle_manager'
require_relative 'civilization'
require_relative 'gold_manager'
require_relative 'unit'
require_relative 'unit_setting'
require_relative 'unit_trainer'
require_relative 'unit_type'
require_relative 'army_manager'

menu_option = {
                'Seleccionar una civilización' => { 1 => 'chinese', 2 => 'english', 3 => 'byzantine' },
              }


def info_screen(army)
  p "#"*30
  p "Nombre de la civilización: #{army.civilization.name}"
  p "Puntos: #{army.total_points}"
  p "Oro: #{army.gold}"
  p "Victorias: #{army.winner_battle.to_s}"
  p "Derrotas: #{army.loser_battle.to_s}"
  p "#"*30
end

#'Que civilización quieres atacar?' => { 1 => 'Chinos', 2 => 'Ingleses', 3 => 'Bizantinos' }
menu_option.each do |key, value|
  p key
  p value
  option = gets.chomp
  @army = ArmyManager.new.send("create_#{value[option.to_i]}")
end

info_screen(@army)

menu_option = {
                'Que civilización quieres atacar?' => { 1 => 'chinese', 2 => 'english', 3 => 'byzantine' }
              }

menu_option.each do |key, value|
  p key
  p value
  option = gets.chomp
  @army_to_attack = ArmyManager.new.send("create_#{value[option.to_i]}")
end


info_screen(@army_to_attack)


p "BATALLA # # " * 3
@army.attack(@army_to_attack)
p ""
p ""
p ""
p "Resultados * * " * 3
info_screen(@army)
info_screen(@army_to_attack)

