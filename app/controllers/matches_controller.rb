class MatchesController < ApplicationController

  # POST /update_score
  def update_score
    match = Match.find(params[:id])
    if params["match"]
      match.set_score params["match"]
    end

    @competition = match.competition
    respond_to do |format|
      format.js
    end
  end

end
