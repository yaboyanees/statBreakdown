json.array!(@stats) do |stat|
  json.extract! stat, :id, :year, :week, :GameMean, :Season2dateMean, :CurrentMeanTrend, :OFFGameMean, :Season2dateOFFMean, :CurrentOFFMeanTrend, :DEFGameMean, :Season2dateDEFMean, :CurrentDEFMeanTrend, :win, :team1pts, :team2pts, :diff, :team1, :team2, :short1, :short2
  json.url stat_url(stat, format: :json)
end