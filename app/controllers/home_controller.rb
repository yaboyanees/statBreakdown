class HomeController < ApplicationController
	def index
 		if params[:firstTeam]
 			#return team1 + team2 search + names
 			@team1 = Stat.search(params[:firstTeam]) 	
 			@team2 = Stat.search(params[:secondTeam])
 			@team1name = @team1.uniq.pluck("team1")
 			@team2name = @team2.uniq.pluck("team1") 			
 			 			
 			#objects to be called by others
 			@all = Stat.all
 			@team1wk = @team1.order("week").uniq.pluck("week")
 			@week = Stat.pluck("week").last
 			@year = Stat.pluck("year").first

			#return most recent table values for team1 + team2 in array
 			@statArrayTeam1 = @team1.where("year = ?", @year).pluck("year", "week", "win", "team2", "team1pts", "team2pts", "id", "url")
 			@team1CurrentStat = @statArrayTeam1.to_a
 			@statArrayTeam2 = @team2.where("year = ?", @year).pluck("year", "week", "win", "team2", "team1pts", "team2pts", "id", "url")
 			@team2CurrentStat = @statArrayTeam2.to_a
 			
			#return team1 + team2 data arrays
 			@team1gt = @team1.where("year = ?", @year).pluck("win", "GameMean")
 			@team2gt = @team2.where("year = ?", @year).pluck("win", "GameMean")			
 			@team1off = @team1.where("year = ?", @year).pluck("win", "OFFGameMean")
 			@team2off = @team2.where("year = ?", @year).pluck("win", "OFFGameMean")
 			@team1def = @team1.where("year = ?", @year).pluck("win", "DEFGameMean")
 			@team2def = @team2.where("year = ?", @year).pluck("win", "DEFGameMean")
 			@team1offVal = @team1.where("year = ?", @year).pluck("OFFGameMean")
 			@team2offVal = @team2.where("year = ?", @year).pluck("OFFGameMean")
 			@team1defVal = @team1.where("year = ?", @year).pluck("DEFGameMean")
 			@team2defVal = @team2.where("year = ?", @year).pluck("DEFGameMean")	
 			@team1s2dm = @team1.where("year = ?", @year).pluck("Season2dateMean")
 			@team2s2dm = @team2.where("year = ?", @year).pluck("Season2dateMean")
 			
 			#return last value for team1 + team2	
 			@teamValue1 = @team1.where("year = ?", @year).pluck("Season2dateMean", "Season2dateOFFMean", "Season2dateDEFMean").last
 			@teamValue2 = @team2.where("year = ?", @year).pluck("Season2dateMean", "Season2dateOFFMean", "Season2dateDEFMean").last
			@team1current = @team1.where("year = ?", @year).pluck("CurrentMeanTrend").last
 			@team2current = @team2.where("year = ?", @year).pluck("CurrentMeanTrend").last
 
 			#return current season2date values by team
 				@teamOrder = @all.group("id", "team1").order("team1")
 				@currentData = @teamOrder.where("week = ?", @week).where("year = ?", @year)
 			@teamValues = @currentData.pluck("Season2dateMean", "Season2dateOFFMean", "Season2dateDEFMean")

 		else
 			@stats = Stat.all
 		end
 		@teamNames = Stat.order(:team1).uniq.pluck(:team1)
	end
	
	def show
		if params[:id]
		 	@team1 = Stat.search(params[:id]) 
		 	@team2 = @team1.pluck("team2")
 			@teamNames = @team1.uniq.pluck("team1") 
 			@team1wk = @team1.order("week").uniq.pluck("week")
						
			#team pt averages by year
			@teamPts2011 = @team1.where("year = ?", 2011).average("team1pts").round
			@opponentPts2011 = @team1.where("year = ?", 2011).average("team2pts").round
			@teamPts2012 = @team1.where("year = ?", 2012).average("team1pts").round
			@opponentPts2012 = @team1.where("year = ?", 2012).average("team2pts").round
			@teamPts2013 = @team1.where("year = ?", 2013).average("team1pts").round
			@opponentPts2013 = @team1.where("year = ?", 2013).average("team2pts").round
			@teamPts2014 = @team1.where("year = ?", 2014).average("team1pts").round
			@opponentPts2014 = @team1.where("year = ?", 2014).average("team2pts").round
			
			#league Off average
			@stat = Stat.all
			@leagueOPts2011 = @stat.where("win = ?", 'W').where("year = ?", 2011).average("team1pts").round
			@leagueOPts2012 = @stat.where("win = ?", 'W').where("year = ?", 2012).average("team1pts").round
			@leagueOPts2013 = @stat.where("win = ?", 'W').where("year = ?", 2013).average("team1pts").round
			@leagueOPts2014 = @stat.where("win = ?", 'W').where("year = ?", 2014).average("team1pts").round
		
			#record by year
			@win11 = @team1.where("win = ?", 'W').where("year = ?", 2011).count
			@loss11 = @team1.where("win = ?", 'L').where("year = ?", 2011).count

			@win12 = @team1.where("win = ?", 'W').where("year = ?", 2012).count
			@loss12 = @team1.where("win = ?", 'L').where("year = ?", 2012).count

			@win13 = @team1.where("win = ?", 'W').where("year = ?", 2013).count
			@loss13 = @team1.where("win = ?", 'L').where("year = ?", 2013).count

			@win14 = @team1.where("win = ?", 'W').where("year = ?", 2014).count
			@loss14 = @team1.where("win = ?", 'L').where("year = ?", 2014).count
			
			#score differences by win and loss
			@winValue14 = @team1.where("win = ?", 'W').where("year = ?", 2014).pluck("week", "diff")
			@lossValue14 = @team1.where("win = ?", 'L').where("year = ?", 2014).pluck("week", "diff")
			@winValue13 = @team1.where("win = ?", 'W').where("year = ?", 2013).pluck("week", "diff")
			@lossValue13 = @team1.where("win = ?", 'L').where("year = ?", 2013).pluck("week", "diff")
			@winValue12 = @team1.where("win = ?", 'W').where("year = ?", 2012).pluck("week", "diff")
			@lossValue12 = @team1.where("win = ?", 'L').where("year = ?", 2012).pluck("week", "diff")
			@winValue11 = @team1.where("win = ?", 'W').where("year = ?", 2011).pluck("week", "diff")
			@lossValue11 = @team1.where("win = ?", 'L').where("year = ?", 2011).pluck("week", "diff")
		
		end
	end
	
	def edit
		@stat = Stat.find(params[:id])
	end
  
end