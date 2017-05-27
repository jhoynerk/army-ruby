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
                'Seleccionar una civilización' => { 1 => 'Chinos', 2 => 'Ingleses', 3 => 'Bizantinos' },
                'Que civilización quieres atacas?' => { 1 => 'Chinos', 2 => 'Ingleses', 3 => 'Bizantinos' }
              }

=begin
menu_option.each do |key, value|
  p key
  p value
  option = gets.chomp
end

=end


#army_chinos = Army.new(civilizations[:chinos])
#army_ingleses = Army.new(civilizations[:ingleses])
#army_bizantinos = Army.new(civilizations[:bizantinos])


army_chinos = ArmyManager.new.create_chinese
army_ingleses = ArmyManager.new.create_english
army_bizantinos = ArmyManager.new.create_byzantine
#p army
p "CHINOS PUNTOS "* 2
p army_chinos.gold
p "INGLESES PUNTOS "* 2
p army_ingleses.total_points
p "BIZANTINOS PUNTOS "* 2
p army_bizantinos.gold


p "BATALLA" * 2
p army_chinos.loser_battle
p army_bizantinos.winner_battle

army_chinos.attack(army_bizantinos)

p army_chinos.loser_battle
p army_bizantinos.winner_battle
p army_bizantinos.gold
p army_chinos.gold

