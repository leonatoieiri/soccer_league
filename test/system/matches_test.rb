require "application_system_test_case"

class MatchesTest < ApplicationSystemTestCase
  setup do
    @match = matches(:one)
  end

  test "visiting the index" do
    visit matches_url
    assert_selector "h1", text: "Matches"
  end

  test "creating a Match" do
    visit matches_url
    click_on "New Match"

    fill_in "Competition", with: @match.competition_id
    fill_in "Group", with: @match.group_id
    fill_in "Home Team", with: @match.home_team_id
    fill_in "Home Team Score", with: @match.home_team_score
    fill_in "Status", with: @match.status
    fill_in "Visitor Team", with: @match.visitor_team_id
    fill_in "Visitor Team Score", with: @match.visitor_team_score
    fill_in "Winner", with: @match.winner
    click_on "Create Match"

    assert_text "Match was successfully created"
    click_on "Back"
  end

  test "updating a Match" do
    visit matches_url
    click_on "Edit", match: :first

    fill_in "Competition", with: @match.competition_id
    fill_in "Group", with: @match.group_id
    fill_in "Home Team", with: @match.home_team_id
    fill_in "Home Team Score", with: @match.home_team_score
    fill_in "Status", with: @match.status
    fill_in "Visitor Team", with: @match.visitor_team_id
    fill_in "Visitor Team Score", with: @match.visitor_team_score
    fill_in "Winner", with: @match.winner
    click_on "Update Match"

    assert_text "Match was successfully updated"
    click_on "Back"
  end

  test "destroying a Match" do
    visit matches_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Match was successfully destroyed"
  end
end
