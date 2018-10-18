require "application_system_test_case"

class CompetitionTeamsTest < ApplicationSystemTestCase
  setup do
    @competition_team = competition_teams(:one)
  end

  test "visiting the index" do
    visit competition_teams_url
    assert_selector "h1", text: "Competition Teams"
  end

  test "creating a Competition team" do
    visit competition_teams_url
    click_on "New Competition Team"

    fill_in "Competition", with: @competition_team.competition_id
    fill_in "Goal Difference", with: @competition_team.goal_difference
    fill_in "Place", with: @competition_team.place
    fill_in "Points", with: @competition_team.points
    fill_in "Team", with: @competition_team.team_id
    click_on "Create Competition team"

    assert_text "Competition team was successfully created"
    click_on "Back"
  end

  test "updating a Competition team" do
    visit competition_teams_url
    click_on "Edit", match: :first

    fill_in "Competition", with: @competition_team.competition_id
    fill_in "Goal Difference", with: @competition_team.goal_difference
    fill_in "Place", with: @competition_team.place
    fill_in "Points", with: @competition_team.points
    fill_in "Team", with: @competition_team.team_id
    click_on "Update Competition team"

    assert_text "Competition team was successfully updated"
    click_on "Back"
  end

  test "destroying a Competition team" do
    visit competition_teams_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Competition team was successfully destroyed"
  end
end
