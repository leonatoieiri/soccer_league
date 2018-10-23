class MatchesController < ApplicationController

  # POST /update_score
  def update_score
    match = Match.find(params[:id])
    if params["match"]
      match.home_team_score = params["match"]["home_team_score"]
      match.visitor_team_score = params["match"]["visitor_team_score"]
      match.status = :done
      match.save
    end

    @competition = match.competition
    respond_to do |format|
      format.js
    end
  end

end
