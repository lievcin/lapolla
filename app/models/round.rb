class Round < ActiveRecord::Base

  attr_accessible :leg, :name, :cup_id

	has_many :games
	belongs_to :cup
	has_many :bets, :through => :games

	validates :name,	:presence => true
	validates_uniqueness_of		:name, :scope => :cup_id
	validates :leg,		:presence => true
	validates :cup_id,	:presence => true
	
end
