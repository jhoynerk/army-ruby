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
require_relative 'emulator'
menu_option = {
                'Seleccionar una civilización' => { 1 => 'chinese', 2 => 'english', 3 => 'byzantine' },
              }


#'Que civilización quieres atacar?' => { 1 => 'Chinos', 2 => 'Ingleses', 3 => 'Bizantinos' }
menu_option.each do |key, value|
  p key
  p value
  option = gets.chomp
  @army = ArmyManager.new.send("create_#{value[option.to_i]}")
end

Emulator.new.print_screen(@army)

menu_option = {
                'Que civilización quieres atacar?' => { 1 => 'chinese', 2 => 'english', 3 => 'byzantine' }
              }

menu_option.each do |key, value|
  p key
  p value
  option = gets.chomp
  @army_to_attack = ArmyManager.new.send("create_#{value[option.to_i]}")
end


Emulator.new.print_screen(@army_to_attack)


p "BATALLA # # " * 3
@army.attack(@army_to_attack)
p ""
p ""
p ""
p "Resultados * * " * 3

Emulator.new.print_screen(@army)
Emulator.new.print_screen(@army_to_attack)

