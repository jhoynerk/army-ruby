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

emulator = Emulator.new
emulator.select_your_civilization
emulator.print_screen

begin

  emulator.select_attack_civilization
  emulator.print_screen(emulator.armies.last)
  p "BATALLA # # " * 3
  emulator.my_army.attack(emulator.armies.last)
  emulator.print_space
  p "Resultados * * " * 3
  emulator.print_screen(emulator.my_army)
  emulator.print_screen(emulator.armies.last)

  p "Volver a luchar?"
  p "1. si"
  p "2. no"
  option = gets.chomp
end until option == "2"



