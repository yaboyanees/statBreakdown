class PortfolioController < ApplicationController
  def index
  	@teamNames = Stat.order(:team1).uniq.pluck(:team1)
  end

  def show
	if params[:id]
		@team1 = Stat.search(params[:id]) 
		@team2 = @team1.pluck("team2")
		@teamNames = @team1.uniq.pluck("team1") 
		@team1wk = @team1.order("week").uniq.pluck("week")

		#return team1 data arrays by year
		@team1tmAll = @team1.pluck("win", "GameMean")	
		@team1offAll = @team1.pluck("win", "OFFGameMean")
		@team1defAll = @team1.pluck("win", "DEFGameMean")
		
		@team1tm14 = @team1.where("year = ?", 2014).pluck("win", "GameMean")	
		@team1off14 = @team1.where("year = ?", 2014).pluck("win", "OFFGameMean")
		@team1def14 = @team1.where("year = ?", 2014).pluck("win", "DEFGameMean")
		
		@team1tm13 = @team1.where("year = ?", 2013).pluck("win", "GameMean")
		@team1off13 = @team1.where("year = ?", 2013).pluck("win", "OFFGameMean")
		@team1def13 = @team1.where("year = ?", 2013).pluck("win", "DEFGameMean")
		
		@team1tm12 = @team1.where("year = ?", 2012).pluck("win", "GameMean")	
		@team1off12 = @team1.where("year = ?", 2012).pluck("win", "OFFGameMean")
		@team1def12 = @team1.where("year = ?", 2012).pluck("win", "DEFGameMean")
		
		@team1tm11 = @team1.where("year = ?", 2011).pluck("win", "GameMean")	
		@team1off11 = @team1.where("year = ?", 2011).pluck("win", "OFFGameMean")
		@team1def11 = @team1.where("year = ?", 2011).pluck("win", "DEFGameMean")
					
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
end
