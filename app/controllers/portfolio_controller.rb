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
			@w11 = @team1.where("year = ?", 2011).where("win = ?", 'W').average("team1pts")
			@l11 = @team1.where("year = ?", 2011).where("win = ?", 'L').average("team2pts")
		@teamPts2011 = ((@w11 + @l11)/2).round	
			@oppw11 = @team1.where("year = ?", 2011).where("win = ?", 'W').average("team2pts")
			@oppl11 = @team1.where("year = ?", 2011).where("win = ?", 'L').average("team1pts")
		@opponentPts2011 = ((@oppw11 + @oppl11)/2).round
		
			@w12 = @team1.where("year = ?", 2012).where("win = ?", 'W').average("team1pts")
			@l12 = @team1.where("year = ?", 2012).where("win = ?", 'L').average("team2pts")
		@teamPts2012 = ((@w12 + @l12)/2).round		
			@oppw12 = @team1.where("year = ?", 2012).where("win = ?", 'W').average("team2pts")
			@oppl12 = @team1.where("year = ?", 2012).where("win = ?", 'L').average("team1pts")
		@opponentPts2012 = ((@oppw12 + @oppl12)/2).round

			@w13 = @team1.where("year = ?", 2013).where("win = ?", 'W').average("team1pts")
			@l13 = @team1.where("year = ?", 2013).where("win = ?", 'L').average("team2pts")		
		@teamPts2013 = ((@w13 + @l13)/2).round
			@oppw13 = @team1.where("year = ?", 2013).where("win = ?", 'W').average("team2pts")
			@oppl13 = @team1.where("year = ?", 2013).where("win = ?", 'L').average("team1pts")
		@opponentPts2013 = ((@oppw13 + @oppl13)/2).round

			@w14 = @team1.where("year = ?", 2014).where("win = ?", 'W').average("team1pts")
			@l14 = @team1.where("year = ?", 2014).where("win = ?", 'L').average("team2pts")			
		@teamPts2014 = ((@w14 + @l14)/2).round
			@oppw14 = @team1.where("year = ?", 2014).where("win = ?", 'W').average("team2pts")
			@oppl14 = @team1.where("year = ?", 2014).where("win = ?", 'L').average("team1pts")
		@opponentPts2014 = ((@oppw14 + @oppl14)/2).round
		
		
		#league Off average
		@stat = Stat.all
			@leaguew11 = @stat.where("win = ?", 'W').where("year = ?", 2011).average("team1pts")
			@leaguel11 = @stat.where("win = ?", 'L').where("year = ?", 2011).average("team2pts")
		@leagueOPts2011 = ((@leaguew11 + @leaguel11)/2).round
		
			@leaguew12 = @stat.where("win = ?", 'W').where("year = ?", 2012).average("team1pts")
			@leaguel12 = @stat.where("win = ?", 'L').where("year = ?", 2012).average("team2pts")
		@leagueOPts2012 = ((@leaguew12 + @leaguel12)/2).round
		
			@leaguew13 = @stat.where("win = ?", 'W').where("year = ?", 2013).average("team1pts")
			@leaguel13 = @stat.where("win = ?", 'L').where("year = ?", 2013).average("team2pts")
		@leagueOPts2013 = ((@leaguew13 + @leaguel13)/2).round
		
			@leaguew14 = @stat.where("win = ?", 'W').where("year = ?", 2014).average("team1pts")
			@leaguel14 = @stat.where("win = ?", 'L').where("year = ?", 2014).average("team2pts")
		@leagueOPts2014 = ((@leaguew14 + @leaguel14)/2).round
	
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
	
		#team schedule by season
		@record14 = @team1.where("year = ?", 2014).pluck("year", "week", "win", "team2", "team1pts", "team2pts", "id", "url")
		@record13 = @team1.where("year = ?", 2013).pluck("year", "week", "win", "team2", "team1pts", "team2pts", "id", "url")
		@record12 = @team1.where("year = ?", 2012).pluck("year", "week", "win", "team2", "team1pts", "team2pts", "id", "url")
		@record11 = @team1.where("year = ?", 2011).pluck("year", "week", "win", "team2", "team1pts", "team2pts", "id", "url")
	end
  end
end
