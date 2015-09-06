class RankingController < ApplicationController
  def index
	@teamNames = Stat.order("team1").uniq.pluck("team1")
	#return current season2date values by team
		@week = Stat.pluck("week").last
		@year = Stat.pluck("year").last
		@teamOrder = Stat.group("id", "team1").order("team1")
		@currentData = @teamOrder.where("week = ?", @week).where("year = ?", @year)
	@teamValues = @currentData.pluck("Season2dateMean", "Season2dateOFFMean", "Season2dateDEFMean")	
  end

  def show
  end
end
