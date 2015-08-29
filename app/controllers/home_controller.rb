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
 			@statArrayTeam1 = @team1.where("year = ?", @year).pluck("year", "week", "win", "team2", "team1pts", "team2pts")
 			@team1CurrentStat = @statArrayTeam1.to_a
 			@statArrayTeam2 = @team2.where("year = ?", @year).pluck("year", "week", "win", "team2", "team1pts", "team2pts")
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
 			@teamValues = @currentData.pluck("Season2dateOFFMean", "Season2dateMean", "Season2dateDEFMean")

 		else
 			@stats = Stat.all
 		end
 		@teamNames = Stat.order(:team1).uniq.pluck(:team1)
	end
	
	def show
		@stats = Stat.all
		@team1 = @stats.select("id", "teamMean", "teamTrendMean", "offMean", "offTrendMean", "defMean", "defTrendMean", "win", "team1pts", "diff", "team1")
	end
  
end