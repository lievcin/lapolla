 # -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Cup.delete_all
Game.delete_all
Round.delete_all
Team.delete_all
User.delete_all
Bet.delete_all

cup1 = Cup.create( :name => "Olympic Football 2012" )

round1 = Round.create(	:name 	=> "Group Stage Round 1", :leg 	=> 1, :cup_id => cup1.id)
round2 = Round.create(	:name 	=> "Group Stage Round 2", :leg 	=> 2, :cup_id => cup1.id)
round3 = Round.create(	:name 	=> "Group Stage Round 3", :leg 	=> 3, :cup_id => cup1.id)

team1 = Team.create(	:name 	=> "Great Britain", :acronim => "GBR")
team2 = Team.create(	:name 	=> "Senegal", :acronim => "SEN")
team3 = Team.create(	:name 	=> "United Arab Emirates", :acronim => "UAE")
team4 = Team.create(	:name 	=> "Uruguay", :acronim => "URU")
team5 = Team.create(	:name 	=> "Mexico", :acronim => "MEX")
team6 = Team.create(	:name 	=> "South Korea Republic", :acronim => "SKO")
team7 = Team.create(	:name 	=> "Gabon", :acronim => "GAB")
team8 = Team.create(	:name 	=> "Switzerland", :acronim => "SWZ")
team9 = Team.create(	:name 	=> "Brazil", :acronim => "BRA")
team10 = Team.create(	:name 	=> "Egypt", :acronim => "EGY")
team11 = Team.create(	:name 	=> "Belarus", :acronim => "BLY")
team12 = Team.create(	:name 	=> "New Zealand", :acronim => "NZL")
team13 = Team.create(	:name 	=> "Spain", :acronim => "SPA")
team14 = Team.create(	:name 	=> "Japan", :acronim => "JPN")
team15 = Team.create(	:name 	=> "Honduras", :acronim => "HON")
team16 = Team.create(	:name 	=> "Morocco", :acronim => "MOR")

admin1 = Admin.create(:username => "elmegapollon", :email => "elmegapollon@gmail.com", :password => "elmegapollon", :password_confirmation => "elmegapollon")


game1 = Game.create(:round_id => round1.id, :kickoff => "26.07.12 17:00", :home_team => team3.id, :away_team => team4.id)
game2 = Game.create(:round_id => round1.id, :kickoff => "26.07.12 20:00", :home_team => team1.id, :away_team => team2.id)
game3 = Game.create(:round_id => round1.id, :kickoff => "26.07.12 14:30", :home_team => team5.id, :away_team => team6.id)
game4 = Game.create(:round_id => round1.id, :kickoff => "26.07.12 17:15", :home_team => team7.id, :away_team => team8.id)
game5 = Game.create(:round_id => round1.id, :kickoff => "26.07.12 19:45", :home_team => team11.id, :away_team => team12.id)
game6 = Game.create(:round_id => round1.id, :kickoff => "26.07.12 19:45", :home_team => team9.id, :away_team => team10.id)
game7 = Game.create(:round_id => round1.id, :kickoff => "26.07.12 14:45", :home_team => team13.id, :away_team => team14.id)
game8 = Game.create(:round_id => round1.id, :kickoff => "26.07.12 12:00", :home_team => team15.id, :away_team => team16.id)

game9 = Game.create(:round_id => round2.id, :kickoff => "29.07.12 17:00", :home_team => team2.id, :away_team => team4.id)
game10 = Game.create(:round_id => round2.id, :kickoff => "29.07.12 19:45", :home_team => team1.id, :away_team => team3.id)
game11 = Game.create(:round_id => round2.id, :kickoff => "29.07.12 14:30", :home_team => team5.id, :away_team => team7.id)
game12 = Game.create(:round_id => round2.id, :kickoff => "29.07.12 17:15", :home_team => team6.id, :away_team => team8.id)
game13 = Game.create(:round_id => round2.id, :kickoff => "29.07.12 15:00", :home_team => team9.id, :away_team => team11.id)
game14 = Game.create(:round_id => round2.id, :kickoff => "29.07.12 12:00", :home_team => team10.id, :away_team => team12.id)
game15 = Game.create(:round_id => round2.id, :kickoff => "29.07.12 19:45", :home_team => team13.id, :away_team => team15.id)
game16 = Game.create(:round_id => round2.id, :kickoff => "29.07.12 17:00", :home_team => team14.id, :away_team => team16.id)

game17 = Game.create(:round_id => round3.id, :kickoff => "01.08.12 19:45", :home_team => team2.id, :away_team => team3.id)
game18 = Game.create(:round_id => round3.id, :kickoff => "01.08.12 19:45", :home_team => team1.id, :away_team => team4.id)
game19 = Game.create(:round_id => round3.id, :kickoff => "01.08.12 17:00", :home_team => team5.id, :away_team => team8.id)
game20 = Game.create(:round_id => round3.id, :kickoff => "01.08.12 17:00", :home_team => team6.id, :away_team => team7.id)
game21 = Game.create(:round_id => round3.id, :kickoff => "01.08.12 14:30", :home_team => team9.id, :away_team => team12.id)
game22 = Game.create(:round_id => round3.id, :kickoff => "01.08.12 14:30", :home_team => team10.id, :away_team => team11.id)
game23 = Game.create(:round_id => round3.id, :kickoff => "01.08.12 17:00", :home_team => team14.id, :away_team => team15.id)
game24 = Game.create(:round_id => round3.id, :kickoff => "01.08.12 17:00", :home_team => team13.id, :away_team => team16.id)


