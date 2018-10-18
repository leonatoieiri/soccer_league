require 'test_helper'

class CompetitionTeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @competition_team = competition_teams(:one)
  end

  test "should get index" do
    get competition_teams_url
    assert_response :success
  end

  test "should get new" do
    get new_competition_team_url
    assert_response :success
  end

  test "should create competition_team" do
    assert_difference('CompetitionTeam.count') do
      post competition_teams_url, params: { competition_team: { competition_id: @competition_team.competition_id, goal_difference: @competition_team.goal_difference, place: @competition_team.place, points: @competition_team.points, team_id: @competition_team.team_id } }
    end

    assert_redirected_to competition_team_url(CompetitionTeam.last)
  end

  test "should show competition_team" do
    get competition_team_url(@competition_team)
    assert_response :success
  end

  test "should get edit" do
    get edit_competition_team_url(@competition_team)
    assert_response :success
  end

  test "should update competition_team" do
    patch competition_team_url(@competition_team), params: { competition_team: { competition_id: @competition_team.competition_id, goal_difference: @competition_team.goal_difference, place: @competition_team.place, points: @competition_team.points, team_id: @competition_team.team_id } }
    assert_redirected_to competition_team_url(@competition_team)
  end

  test "should destroy competition_team" do
    assert_difference('CompetitionTeam.count', -1) do
      delete competition_team_url(@competition_team)
    end

    assert_redirected_to competition_teams_url
  end
end
