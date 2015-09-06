class Stat < ActiveRecord::Base

	def self.import(file)
	  CSV.foreach(file.path, headers: true) do |row|
		Stat.create! row.to_hash
	  end
	end

# 	def gameResult
# 		if self.win.nil?
# 			a = "BYE"
# 		elsif self.win?
# 			a = "W"
# 		else
# 			a = "L"
# 		end 
# 		return a
# 	end
	
	def self.search(query1)
  		where("team1 like ?", "%#{query1}%")  		
	end

	def self.search(query2)
  		where("team1 like ?", "%#{query2}%")  		
	end
end
