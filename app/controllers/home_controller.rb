class HomeController < ApplicationController
	def index
 		if params[:firstTeam]
 			@team1 = Stat.search(params[:firstTeam]) 	
 			@team1wk = @team1.pluck("week")
 			@team1gt = @team1.pluck("GameMean")
 			@team1off = @team1.pluck("OFFGameMean")
 			@team1def = @team1.pluck("DEFGameMean")
 			@team1s2dm = @team1.pluck("Season2dateMean")
 			@team1name = @team1.uniq.pluck("team1")
 			@team1result = @team1.select("win")

 			@team2 = Stat.search(params[:secondTeam])
  			@team2name = @team2.uniq.pluck("team1")
  			@team2gt = @team2.pluck("GameMean")
 			@team2off = @team2.pluck("OFFGameMean")
 			@team2def = @team2.pluck("DEFGameMean")
 			@team2s2dm = @team2.pluck("Season2dateMean")
 		else
 			@stats = Stat.all
 		end
 		@teamNames = Stat.uniq.pluck(:team1)
	end
	
	def show
		@stats = Stat.all
		@team1 = @stats.select("id", "teamMean", "teamTrendMean", "offMean", "offTrendMean", "defMean", "defTrendMean", "win", "team1pts", "diff", "team1")
	end
end

