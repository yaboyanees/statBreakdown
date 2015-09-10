class RankingController < ApplicationController
  def index
	@teamNames = Stat.order("team1").uniq.pluck("team1")
	#return current season2date values by team
		@week = Stat.pluck("week").last
		@year = Stat.pluck("year").last
		@teamOrder = Stat.group("id", "team1").order("team1")
		@currentData = @teamOrder.where("week = ?", @week).where("year = ?", @year)
	@teamValues = @currentData.pluck("Season2dateMean", "Season2dateOFFMean", "Season2dateDEFMean")	
  	@teamCurrent = Stat.where("year = ?", @year).where("week = ?", @week).pluck("CurrentMeanTrend")	
	
	#Season-Q TEAM, Trend-Q TEAM, Season-Q OFF, Trend-Q OFF, Season-Q DEF, Trend-Q DEF
	@dataValues = Stat.order("team1").where("week = ?", @week).where("year = ?", @year).pluck("short1", "Season2dateMean", "CurrentMeanTrend", "Season2dateOFFMean", "CurrentOFFMeanTrend", "Season2dateDEFMean", "CurrentDEFMeanTrend")
	#overall record, last 4 games
		@team1 = Stat.where("short1 = ?", 'ARI')
		@team2 = Stat.where("short1 = ?", 'ATL')
		@team3 = Stat.where("short1 = ?", 'BAL')
		@team4 = Stat.where("short1 = ?", 'BUF')
		@team5 = Stat.where("short1 = ?", 'CAR')
		@team6 = Stat.where("short1 = ?", 'CHI')
		@team7 = Stat.where("short1 = ?", 'CIN')
		@team8 = Stat.where("short1 = ?", 'CLE')
		@team9 = Stat.where("short1 = ?", 'DAL')
		@team10 = Stat.where("short1 = ?", 'DEN')
		@team11 = Stat.where("short1 = ?", 'DET')
		@team12 = Stat.where("short1 = ?", 'GB')
		@team13 = Stat.where("short1 = ?", 'HOU')
		@team14 = Stat.where("short1 = ?", 'IND')
		@team15 = Stat.where("short1 = ?", 'JAX')
		@team16 = Stat.where("short1 = ?", 'KC')
		@team17 = Stat.where("short1 = ?", 'MIA')
		@team18 = Stat.where("short1 = ?", 'MIN')
		@team19 = Stat.where("short1 = ?", 'NE')
		@team20 = Stat.where("short1 = ?", 'NO')
		@team21 = Stat.where("short1 = ?", 'NYG')
		@team22 = Stat.where("short1 = ?", 'NYJ')
		@team23 = Stat.where("short1 = ?", 'OAK')
		@team24 = Stat.where("short1 = ?", 'PHI')
		@team25 = Stat.where("short1 = ?", 'PIT')
		@team26 = Stat.where("short1 = ?", 'SD')
		@team27 = Stat.where("short1 = ?", 'SF')
		@team28 = Stat.where("short1 = ?", 'SEA')
		@team29 = Stat.where("short1 = ?", 'STL')
		@team30 = Stat.where("short1 = ?", 'TB')
		@team31 = Stat.where("short1 = ?", 'TEN')
		@team32 = Stat.where("short1 = ?", 'WSH')


	@winT1 = @team1.where("win = ?", 'W').where("year = ?", @year).count
	@lossT1 = @team1.where("win = ?", 'L').where("year = ?", @year).count

	@winT2 = @team2.where("win = ?", 'W').where("year = ?", @year).count
	@lossT2 = @team2.where("win = ?", 'L').where("year = ?", @year).count

	@winT3 = @team3.where("win = ?", 'W').where("year = ?", @year).count
	@lossT3 = @team3.where("win = ?", 'L').where("year = ?", @year).count

	@winT4 = @team4.where("win = ?", 'W').where("year = ?", @year).count
	@lossT4 = @team4.where("win = ?", 'L').where("year = ?", @year).count

	@winT5 = @team5.where("win = ?", 'W').where("year = ?", @year).count
	@lossT5 = @team5.where("win = ?", 'L').where("year = ?", @year).count

	@winT6 = @team6.where("win = ?", 'W').where("year = ?", @year).count
	@lossT6 = @team6.where("win = ?", 'L').where("year = ?", @year).count

	@winT7 = @team7.where("win = ?", 'W').where("year = ?", @year).count
	@lossT7 = @team7.where("win = ?", 'L').where("year = ?", @year).count

	@winT8 = @team8.where("win = ?", 'W').where("year = ?", @year).count
	@lossT8 = @team8.where("win = ?", 'L').where("year = ?", @year).count

	@winT9 = @team9.where("win = ?", 'W').where("year = ?", @year).count
	@lossT9 = @team9.where("win = ?", 'L').where("year = ?", @year).count

	@winT10 = @team10.where("win = ?", 'W').where("year = ?", @year).count
	@lossT10 = @team10.where("win = ?", 'L').where("year = ?", @year).count

	@winT11 = @team11.where("win = ?", 'W').where("year = ?", @year).count
	@lossT11 = @team11.where("win = ?", 'L').where("year = ?", @year).count

	@winT12 = @team12.where("win = ?", 'W').where("year = ?", @year).count
	@lossT12 = @team12.where("win = ?", 'L').where("year = ?", @year).count

	@winT13 = @team13.where("win = ?", 'W').where("year = ?", @year).count
	@lossT13 = @team13.where("win = ?", 'L').where("year = ?", @year).count

	@winT14 = @team14.where("win = ?", 'W').where("year = ?", @year).count
	@lossT14 = @team14.where("win = ?", 'L').where("year = ?", @year).count

	@winT15 = @team15.where("win = ?", 'W').where("year = ?", @year).count
	@lossT15 = @team15.where("win = ?", 'L').where("year = ?", @year).count

	@winT16 = @team16.where("win = ?", 'W').where("year = ?", @year).count
	@lossT16 = @team16.where("win = ?", 'L').where("year = ?", @year).count

	@winT17 = @team17.where("win = ?", 'W').where("year = ?", @year).count
	@lossT17 = @team17.where("win = ?", 'L').where("year = ?", @year).count

	@winT18 = @team18.where("win = ?", 'W').where("year = ?", @year).count
	@lossT18 = @team18.where("win = ?", 'L').where("year = ?", @year).count

	@winT19 = @team19.where("win = ?", 'W').where("year = ?", @year).count
	@lossT19 = @team19.where("win = ?", 'L').where("year = ?", @year).count

	@winT20 = @team20.where("win = ?", 'W').where("year = ?", @year).count
	@lossT20 = @team20.where("win = ?", 'L').where("year = ?", @year).count

	@winT21 = @team21.where("win = ?", 'W').where("year = ?", @year).count
	@lossT21 = @team21.where("win = ?", 'L').where("year = ?", @year).count

	@winT22 = @team22.where("win = ?", 'W').where("year = ?", @year).count
	@lossT22 = @team22.where("win = ?", 'L').where("year = ?", @year).count

	@winT23 = @team23.where("win = ?", 'W').where("year = ?", @year).count
	@lossT23 = @team23.where("win = ?", 'L').where("year = ?", @year).count

	@winT24 = @team24.where("win = ?", 'W').where("year = ?", @year).count
	@lossT24 = @team24.where("win = ?", 'L').where("year = ?", @year).count

	@winT25 = @team25.where("win = ?", 'W').where("year = ?", @year).count
	@lossT25 = @team25.where("win = ?", 'L').where("year = ?", @year).count

	@winT26 = @team26.where("win = ?", 'W').where("year = ?", @year).count
	@lossT26 = @team26.where("win = ?", 'L').where("year = ?", @year).count

	@winT27 = @team27.where("win = ?", 'W').where("year = ?", @year).count
	@lossT27 = @team27.where("win = ?", 'L').where("year = ?", @year).count

	@winT28 = @team28.where("win = ?", 'W').where("year = ?", @year).count
	@lossT28 = @team28.where("win = ?", 'L').where("year = ?", @year).count

	@winT29 = @team29.where("win = ?", 'W').where("year = ?", @year).count
	@lossT29 = @team29.where("win = ?", 'L').where("year = ?", @year).count

	@winT30 = @team30.where("win = ?", 'W').where("year = ?", @year).count
	@lossT30 = @team30.where("win = ?", 'L').where("year = ?", @year).count

	@winT31 = @team31.where("win = ?", 'W').where("year = ?", @year).count
	@lossT31 = @team31.where("win = ?", 'L').where("year = ?", @year).count

	@winT32 = @team32.where("win = ?", 'W').where("year = ?", @year).count
	@lossT32 = @team32.where("win = ?", 'L').where("year = ?", @year).count

	@winArray = [[@winT1], [@winT2], [@winT3], [@winT4], [@winT5], [@winT6], [@winT7], [@winT8], [@winT9], [@winT10], [@winT11], [@winT12], [@winT13], [@winT14], [@winT15], [@winT16], [@winT17], [@winT18], [@winT19], [@winT20], [@winT21], [@winT22], [@winT23], [@winT24], [@winT25], [@winT26], [@winT27], [@winT28], [@winT29], [@winT30], [@winT31], [@winT32]].to_a
	@lossArray = [@lossT1, @lossT2, @lossT3, @lossT4, @lossT5, @lossT6, @lossT7, @lossT8, @lossT9, @lossT10, @lossT11, @lossT12, @lossT13, @lossT14, @lossT15, @lossT16, @lossT17, @lossT18, @lossT19, @lossT20, @lossT21, @lossT22, @lossT23, @lossT24, @lossT25, @lossT26, @lossT27, @lossT28, @lossT29, @lossT30, @lossT31, @lossT32].to_a  
  end

  def show
  end
end