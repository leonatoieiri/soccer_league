class CompetitionsController < ApplicationController

  # GET /simulate/:id
  def simulate
    competition = Competition.find(params[:id])
    @teams = competition.simulate params["match"]

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
