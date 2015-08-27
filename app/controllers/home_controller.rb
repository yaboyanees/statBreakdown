class HomeController < ApplicationController
	def index
 		if params[:firstTeam]
 			@team1 = Stat.search(params[:firstTeam]) 
 			@tt = @team1.all
 			
 			@team1wk = @team1.uniq.pluck("week")
 			@team1gt = @team1.pluck("GameMean")
 			@team1gt = @team1.pluck("win", "GameMean")
 			@team1off = @team1.pluck("OFFGameMean")
 			@team1def = @team1.pluck("DEFGameMean")
 			@team1s2dm = @team1.pluck("Season2dateMean")
 			@team1name = @team1.uniq.pluck("team1")
 			@team1result = @team1.pluck("win")
 			@team1current = @team1.pluck("CurrentMeanTrend").last

 			@team2 = Stat.search(params[:secondTeam])
  			@team2name = @team2.uniq.pluck("team1")
  			@team2gt = @team2.pluck("win", "GameMean")
 			@team2off = @team2.pluck("OFFGameMean")
 			@team2def = @team2.pluck("DEFGameMean")
 			@team2s2dm = @team2.pluck("Season2dateMean")
 			@team2current = @team2.pluck("CurrentMeanTrend").last
 			
 			@teamValue1 = @team1.pluck("Season2dateMean", "Season2dateOFFMean", "Season2dateDEFMean").last
 			@teamValue2 = @team2.pluck("Season2dateMean", "Season2dateOFFMean", "Season2dateDEFMean").last
 			
 			@a = Stat.all
 			@b = @a.group("Season2dateMean", "Season2dateOFFMean", "Season2dateDEFMean", "team1", "created_at")
 			@c = @b.having("created_at = MAX(created_at)")
 			@teamValues = @c.pluck("Season2dateMean", "Season2dateOFFMean", "Season2dateDEFMean")

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