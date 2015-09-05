class RankingController < ApplicationController
  def index
	#return current season2date values by team
		@teamOrder = Stat.group("id", "team1").order("team1")
		@currentData = @teamOrder.where("week = ?", @week).where("year = ?", 2014)
	@teamValues = @currentData.pluck("Season2dateMean", "Season2dateOFFMean", "Season2dateDEFMean")	
  end

  def show
  end
end
