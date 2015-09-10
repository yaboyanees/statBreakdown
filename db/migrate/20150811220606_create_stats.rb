class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :year    	
      t.integer :week
      t.integer :GameMean
      t.integer :Season2dateMean
      t.integer :CurrentMeanTrend
      
      t.integer :OFFGameMean
      t.integer :Season2dateOFFMean
      t.integer :CurrentOFFMeanTrend
      
      t.integer :DEFGameMean
      t.integer :Season2dateDEFMean
      t.integer :CurrentDEFMeanTrend
      
      t.string 	:win
      t.integer :team1pts
      t.integer :team2pts
      t.integer :diff
      t.string 	:team1
      t.string 	:team2
      
      t.string 	:short1
      t.string 	:short2
      
      t.string 	:url
      
      t.timestamps null: false
    end
  end
end

