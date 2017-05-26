class Army < ActiveRecord::Base
  has_many :units
  belongs_to :civilization

  has_many :winner_battle, class_name: 'Battle', foreign_key: 'winner_id'
  has_many :loser_battle, class_name: 'Battle', foreign_key: 'loser_id'

  attr_accessor :ammount

  before_create :default_ammount, :setting

  def setting
    civilization.unit_settings.each do |setting|
      (1..setting.default_count_unit).each do
        Unit.create(army: self, unit_type: setting.unit_type)
      end
    end
  end

  def default_ammount
    self.ammount = 1000
  end

  def total_points
    units.total_points
  end

  def greater_subtract_unit(quantity)
    units.max_points(quantity).destroy
  end

end
