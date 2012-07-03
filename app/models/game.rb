class Game < ActiveRecord::Base

  attr_accessible :kickoff, :home_score, :away_score, :round_id, :home_team, :away_team

	has_many :bets
	has_many :users, :through => :bets
	belongs_to :round
	belongs_to :cup
	has_and_belongs_to_many :teams

	validates :round_id,	:presence => true
	validates :kickoff, 	:presence => true
	validates :home_team,	:presence => true
	validates :away_team,	:presence => true
	validates_numericality_of :home_score, :only_integer => true, :allow_nil => true
	validates_numericality_of :away_score, :only_integer => true, :allow_nil => true
  
end
