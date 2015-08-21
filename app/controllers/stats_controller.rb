class StatsController < ApplicationController
  before_action :set_stat, only: [:show, :edit, :update, :destroy]

  # GET /stats
  # GET /stats.json
  def index
    @stats = Stat.all
  end
  
  def show
  	@a = Stat.all
	@team1 = @a
	#@a.select("id", "GameMean", "teamTrendMean", "offMean", "offTrendMean", "defMean", "defTrendMean", "win", "team1pts", "diff", "team1")
  end
  
  def import
  	Stat.import(params[:file])
  	redirect_to stats_url
  end

  def create
    @stat = Stat.new(stat_params)
	redirect_to stats_url

  end

  def destroy
    @stat.destroy
    respond_to do |format|
      format.html { redirect_to stats_url, notice: 'Stat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stat
      @stat = Stat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stat_params
      params.require(:stat).permit(:week, :GameMean, :Season2dateMean, :OFFGameMean, :Season2dateOFFMean, :DEFGameMean, :Season2dateDEFMean, :win, :team1pts, :team2pts, :diff, :team1, :team2)
    end
end
