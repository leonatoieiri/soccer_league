class CompetitionsController < ApplicationController

  # GET /simulate/:id
  def simulate
    competition = Competition.find(params[:id])
    @teams = {}
    competition.competition_teams.each do |comp_team|
      @teams[comp_team.team_id.to_s] = comp_team
    end

    params["match"].each do |match_id, data|
      goal_difference = data["home_team_score"].to_i - data["visitor_team_score"].to_i
      @teams[data["home_team_id"]].goal_difference += goal_difference
      @teams[data["visitor_team_id"]].goal_difference -= goal_difference
      if goal_difference > 0
        @teams[data["home_team_id"]].points += 3
      elsif goal_difference < 0
        @teams[data["visitor_team_id"]].points += 3
      else
        @teams[data["home_team_id"]].points += 1
        @teams[data["visitor_team_id"]].points += 1
      end
    end

    @teams = @teams.values.sort_by { |team| [team.points, team.goal_difference] }
    @teams = @teams.reverse

    respond_to do |format|
      format.js
    end
  end

  # GET /generate_matches
  def generate_matches
    @competition = Competition.find(params[:id])
    if @competition.double_rr?
      @competition.generate_matches
    else
      @competition.generate_groups
    end
    respond_to do |format|
      format.js
    end
  end

end
