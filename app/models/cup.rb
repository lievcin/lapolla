class Cup < ActiveRecord::Base

  attr_accessible :name
	has_many :rounds
	has_many :games, :through => :rounds
	has_many :teams

	validates :name,	:presence => true, :uniqueness => true
	
end
