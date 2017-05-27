require_relative 'army'
require_relative 'battle'
require_relative 'battle_manager'
require_relative 'civilization'
require_relative 'gold_manager'
require_relative 'unit'
require_relative 'unit_setting'
require_relative 'unit_trainer'
require_relative 'unit_type'


=begin
  piquero 5 points, 3 training points, 10 training cost
  arquero 10 points, 7 training points, 20 training cost
  caballero 20 points, 10 training points, 30 training cost
=end

piquero = UnitType.new( 'Piquero', 5, 3, 10 )
arquero = UnitType.new( 'Arquero', 10, 7, 20 )
caballero = UnitType.new( 'Caballero', 20, 10, 30 )

=begin
  chinos 2 25 2
  ingleses 10 10 10
  bizantinos 5 8 15
=end
default_chinos = []
default_chinos << UnitSetting.new( 2, piquero)
default_chinos << UnitSetting.new( 25, arquero)
default_chinos << UnitSetting.new( 2, caballero)

chinos = Civilization.new('Chinos', default_chinos)

default_ingleses = []
default_ingleses << UnitSetting.new( 10, piquero)
default_ingleses << UnitSetting.new( 10, arquero)
default_ingleses << UnitSetting.new( 10, caballero)

ingleses = Civilization.new('Ingleses', default_ingleses)

default_bizantinos = []
default_bizantinos << UnitSetting.new( 5, piquero)
default_bizantinos << UnitSetting.new( 8, arquero)
default_bizantinos << UnitSetting.new( 15, caballero)

bizantinos = Civilization.new('Bizantinos', default_bizantinos)


#p chinos.unit_settings
#p ingleses.unit_settings
#p bizantinos.unit_settings


army_chinos = Army.new(chinos)
army_ingleses = Army.new(ingleses)
army_bizantinos = Army.new(bizantinos)
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
