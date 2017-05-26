class UnitType < ActiveRecord::Base
  belongs_to :civilization
  has_many :units

  attr_accessor :name, :points, :training_cost, :training_points
end
