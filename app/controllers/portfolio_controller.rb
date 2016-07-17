class PortfolioController < ApplicationController
  def index
  	@teamNames = Stat.order(:team1).uniq.pluck(:team1, :short1)
  end

  def show
	@team1 = Stat.where("short1 = ?", params[:id]) 
	@team2 = @team1.pluck("team2")
	@teamNames = @team1.uniq.pluck("team1") 
	@team1wk = @team1.order("week").uniq.pluck("week")
	@year = Stat.pluck("year").last
	
	#return team1 data arrays by year
	@team1tmAll = @team1.pluck("win", "GameMean")	
	@team1offAll = @team1.pluck("win", "OFFGameMean")
	@team1defAll = @team1.pluck("win", "DEFGameMean")
	@team1s2dmAll = @team1.pluck("win", "Season2dateMean")

	@team1tm16 = @team1.where("year = ?", 2016).pluck("win", "GameMean") 	
	@team1off16 = @team1.where("year = ?", 2016).pluck("win", "OFFGameMean")
	@team1def16 = @team1.where("year = ?", 2016).pluck("win", "DEFGameMean")
	@team1s2dm16 = @team1.where("year = ?", 2016).pluck("win", "Season2dateMean")

	@team1tm15 = @team1.where("year = ?", 2015).pluck("win", "GameMean") 	
	@team1off15 = @team1.where("year = ?", 2015).pluck("win", "OFFGameMean")
	@team1def15 = @team1.where("year = ?", 2015).pluck("win", "DEFGameMean")
	@team1s2dm15 = @team1.where("year = ?", 2015).pluck("win", "Season2dateMean")

	@team1tm14 = @team1.where("year = ?", 2014).pluck("win", "GameMean")	
	@team1off14 = @team1.where("year = ?", 2014).pluck("win", "OFFGameMean")
	@team1def14 = @team1.where("year = ?", 2014).pluck("win", "DEFGameMean")
	@team1s2dm14 = @team1.where("year = ?", 2014).pluck("win", "Season2dateMean")
	
	@team1tm13 = @team1.where("year = ?", 2013).pluck("win", "GameMean")
	@team1off13 = @team1.where("year = ?", 2013).pluck("win", "OFFGameMean")
	@team1def13 = @team1.where("year = ?", 2013).pluck("win", "DEFGameMean")
	@team1s2dm13 = @team1.where("year = ?", 2013).pluck("win", "Season2dateMean")
	
	@team1tm12 = @team1.where("year = ?", 2012).pluck("win", "GameMean")	
	@team1off12 = @team1.where("year = ?", 2012).pluck("win", "OFFGameMean")
	@team1def12 = @team1.where("year = ?", 2012).pluck("win", "DEFGameMean")
	@team1s2dm12 = @team1.where("year = ?", 2012).pluck("win", "Season2dateMean")
	
	@team1tm11 = @team1.where("year = ?", 2011).pluck("win", "GameMean")	
	@team1off11 = @team1.where("year = ?", 2011).pluck("win", "OFFGameMean")
	@team1def11 = @team1.where("year = ?", 2011).pluck("win", "DEFGameMean")
	@team1s2dm11 = @team1.where("year = ?", 2011).pluck("win", "Season2dateMean")
				
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
	
		@w15 = @team1.where("year = ?", 2015).where("win = ?", 'W').pluck("team1pts")
		@l15 = @team1.where("year = ?", 2015).where("win = ?", 'L').pluck("team2pts")	
		@ptsFor15 = @w15 + @l15
	@teamPts2015 = (@ptsFor15.inject(0) { |sum, el| sum + el } / @ptsFor15.size)
		@oppw15 = @team1.where("year = ?", 2015).where("win = ?", 'W').pluck("team2pts")
		@oppl15 = @team1.where("year = ?", 2015).where("win = ?", 'L').pluck("team1pts")
		@ptsAgainst15 = @oppw15 + @oppl15
	@opponentPts2015 = (@ptsAgainst15.inject(0) { |add, ea| add + ea } / @ptsAgainst15.size)

	if @year == 2016
		@w16 = @team1.where("year = ?", 2016).where("win = ?", 'W').pluck("team1pts")
		@l16 = @team1.where("year = ?", 2016).where("win = ?", 'L').pluck("team2pts")	
		@ptsFor16 = @w16 + @l16
	@teamPts2016 = (@ptsFor16.inject(0) { |sum, el| sum + el } / @ptsFor16.size)
		@oppw16 = @team1.where("year = ?", 2016).where("win = ?", 'W').pluck("team2pts")
		@oppl16 = @team1.where("year = ?", 2016).where("win = ?", 'L').pluck("team1pts")
		@ptsAgainst16 = @oppw16 + @oppl16
	@opponentPts2016 = (@ptsAgainst16.inject(0) { |add, ea| add + ea } / @ptsAgainst16.size)
	end
	
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

		@leaguew15 = @stat.where("win = ?", 'W').where("year = ?", 2015).average("team1pts")
		@leaguel15 = @stat.where("win = ?", 'L').where("year = ?", 2015).average("team2pts")
	@leagueOPts2015 = ((@leaguew15 + @leaguel15)/2).round

	if @year == 2016
		@leaguew16 = @stat.where("win = ?", 'W').where("year = ?", 2016).average("team1pts")
		@leaguel16 = @stat.where("win = ?", 'L').where("year = ?", 2016).average("team2pts")
	@leagueOPts2016 = ((@leaguew16 + @leaguel16)/2).round
	
	end
	
	#record by year
	@win11 = @team1.where("win = ?", 'W').where("year = ?", 2011).count
	@loss11 = @team1.where("win = ?", 'L').where("year = ?", 2011).count

	@win12 = @team1.where("win = ?", 'W').where("year = ?", 2012).count
	@loss12 = @team1.where("win = ?", 'L').where("year = ?", 2012).count

	@win13 = @team1.where("win = ?", 'W').where("year = ?", 2013).count
	@loss13 = @team1.where("win = ?", 'L').where("year = ?", 2013).count

	@win14 = @team1.where("win = ?", 'W').where("year = ?", 2014).count
	@loss14 = @team1.where("win = ?", 'L').where("year = ?", 2014).count

	@win15 = @team1.where("win = ?", 'W').where("year = ?", 2015).count
	@loss15 = @team1.where("win = ?", 'L').where("year = ?", 2015).count	

	@win16 = @team1.where("win = ?", 'W').where("year = ?", 2016).count
	@loss16 = @team1.where("win = ?", 'L').where("year = ?", 2016).count	
	
	#score differences by win and loss
	@winValue16 = @team1.where("win = ?", 'W').where("year = ?", 2016).pluck("week", "diff")
	@lossValue16 = @team1.where("win = ?", 'L').where("year = ?", 2016).pluck("week", "diff")
	@winValue15 = @team1.where("win = ?", 'W').where("year = ?", 2015).pluck("week", "diff")
	@lossValue15 = @team1.where("win = ?", 'L').where("year = ?", 2015).pluck("week", "diff")
	@winValue14 = @team1.where("win = ?", 'W').where("year = ?", 2014).pluck("week", "diff")
	@lossValue14 = @team1.where("win = ?", 'L').where("year = ?", 2014).pluck("week", "diff")
	@winValue13 = @team1.where("win = ?", 'W').where("year = ?", 2013).pluck("week", "diff")
	@lossValue13 = @team1.where("win = ?", 'L').where("year = ?", 2013).pluck("week", "diff")
	@winValue12 = @team1.where("win = ?", 'W').where("year = ?", 2012).pluck("week", "diff")
	@lossValue12 = @team1.where("win = ?", 'L').where("year = ?", 2012).pluck("week", "diff")
	@winValue11 = @team1.where("win = ?", 'W').where("year = ?", 2011).pluck("week", "diff")
	@lossValue11 = @team1.where("win = ?", 'L').where("year = ?", 2011).pluck("week", "diff")

	#team schedule by season
	@record16 = @team1.where("year = ?", 2016).pluck("year", "week", "win", "team2", "team1pts", "team2pts", "id", "url")
	@record15 = @team1.where("year = ?", 2015).pluck("year", "week", "win", "team2", "team1pts", "team2pts", "id", "url")
	@record14 = @team1.where("year = ?", 2014).pluck("year", "week", "win", "team2", "team1pts", "team2pts", "id", "url")
	@record13 = @team1.where("year = ?", 2013).pluck("year", "week", "win", "team2", "team1pts", "team2pts", "id", "url")
	@record12 = @team1.where("year = ?", 2012).pluck("year", "week", "win", "team2", "team1pts", "team2pts", "id", "url")
	@record11 = @team1.where("year = ?", 2011).pluck("year", "week", "win", "team2", "team1pts", "team2pts", "id", "url")
  end
end
