require 'test_helper'

class StatsControllerTest < ActionController::TestCase
  setup do
    @stat = stats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stat" do
    assert_difference('Stat.count') do
      post :create, stat: { defMean: @stat.defMean, defTrendMean: @stat.defTrendMean, diff: @stat.diff, offMean: @stat.offMean, offTrendMean: @stat.offTrendMean, season: @stat.season, team1: @stat.team1, team1pts: @stat.team1pts, team2: @stat.team2, team2pts: @stat.team2pts, teamMean: @stat.teamMean, teamTrendMean: @stat.teamTrendMean, win: @stat.win }
    end

    assert_redirected_to stat_path(assigns(:stat))
  end

  test "should show stat" do
    get :show, id: @stat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stat
    assert_response :success
  end

  test "should update stat" do
    patch :update, id: @stat, stat: { defMean: @stat.defMean, defTrendMean: @stat.defTrendMean, diff: @stat.diff, offMean: @stat.offMean, offTrendMean: @stat.offTrendMean, season: @stat.season, team1: @stat.team1, team1pts: @stat.team1pts, team2: @stat.team2, team2pts: @stat.team2pts, teamMean: @stat.teamMean, teamTrendMean: @stat.teamTrendMean, win: @stat.win }
    assert_redirected_to stat_path(assigns(:stat))
  end

  test "should destroy stat" do
    assert_difference('Stat.count', -1) do
      delete :destroy, id: @stat
    end

    assert_redirected_to stats_path
  end
end
