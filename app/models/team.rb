class Team < ActiveRecord::Base

  attr_accessible :name, :acronim
	has_and_belongs_to_many :games
	
	validates :name, 	:presence => true, :uniqueness => true
	validates :acronim,	:presence => true, :uniqueness => true
	validates_length_of :acronim, :is => 3, :message => "Abbreviation must have three characters"

	before_validation :uppercase_acronym

	def uppercase_acronym
		self.acronim.upcase!
	end

end
