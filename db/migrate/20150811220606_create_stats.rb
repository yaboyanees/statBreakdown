class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :year    	
      t.integer :week
      t.float 	:GameMean
      t.float 	:Season2dateMean
      t.float 	:CurrentMeanTrend
      
      t.float 	:OFFGameMean
      t.float 	:Season2dateOFFMean
      t.float 	:CurrentOFFMeanTrend
      
      t.float 	:DEFGameMean
      t.float 	:Season2dateDEFMean
      t.float 	:CurrentDEFMeanTrend
      
      t.string 	:win
      t.integer :team1pts
      t.integer :team2pts
      t.integer :diff
      t.string 	:team1
      t.string 	:team2
      
      t.string 	:short1
      t.string 	:short2
      
      t.timestamps null: false
    end
  end
end

