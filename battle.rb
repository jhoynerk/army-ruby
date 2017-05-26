class Battle < ActiveRecord::Base

  belongs_to :loser, class_name: 'Army'
  belongs_to :winner, class_name: 'Army'

  attr_accessor :points_win, :winner_id, :loser_id, :date
end
