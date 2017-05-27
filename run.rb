require_relative 'army'
require_relative 'battle'
require_relative 'battle_manager'
require_relative 'civilization'
require_relative 'gold_manager'
require_relative 'unit'
require_relative 'unit_setting'
require_relative 'unit_trainer'
require_relative 'unit_type'


menu_option = {
                'Seleccionar una civilización' => { 1 => 'Chinos', 2 => 'Ingleses', 3 => 'Bizantinos' },
                'Que civilización quieres atacas?' => { 1 => 'Chinos', 2 => 'Ingleses', 3 => 'Bizantinos' }
              }

unit_option = {
                piquero: { points: 5, training_points: 3, training_cost: 10 },
                arquero: { points: 10, training_points: 7, training_cost:  20 },
                caballero: { points: 20, training_points: 10, training_cost:  30 }
              }

unit_defaults =
              {
                chinos: { piquero: 2, arquero: 25, caballero: 2 },
                ingleses: { piquero: 10, arquero: 10, caballero: 10 },
                bizantinos: { piquero: 5, arquero: 8, caballero: 15 }
              }

array_unit_types = {}
unit_option.each do |key, v|
  array_unit_types[key] = UnitType.new( key.to_s, v[:points], v[:training_points], v[:training_cost] )
end

units_civilization = {}
unit_defaults.each do |key, v|
  units_civilization[key] = v.map { |k, count| UnitSetting.new(count, array_unit_types[k]) }
end

civilizations = {}
units_civilization.each do |key, defaults|
  civilizations[key] = Civilization.new(key.to_s, defaults)
end


p civilizations
#chinos = Civilization.new('Chinos', default_chinos)
#ingleses = Civilization.new('Ingleses', default_ingleses)
#bizantinos = Civilization.new('Bizantinos', default_bizantinos)

=begin
menu_option.each do |key, value|
  p key
  p value
  option = gets.chomp
end

=end



#p chinos.unit_settings
#p ingleses.unit_settings
#p bizantinos.unit_settings


army_chinos = Army.new(civilizations[:chinos])
army_ingleses = Army.new(civilizations[:ingleses])
army_bizantinos = Army.new(civilizations[:bizantinos])
#p army
p "CHINOS PUNTOS "* 2
p army_chinos.gold
p "INGLESES PUNTOS "* 2
p army_ingleses.total_points
p "BIZANTINOS PUNTOS "* 2
p army_bizantinos.gold


p "BATALLA" * 2


army_chinos.attack(army_bizantinos)

p army_chinos.loser_battle
p army_bizantinos.winner_battle
p army_bizantinos.gold
p army_chinos.gold

