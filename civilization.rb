class Civilization < ActiveRecord::Base
  has_many :unit_types
  has_many :unit_settings
  has_many :armies

  attr_accessor :name
end
