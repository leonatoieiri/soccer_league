class CompetitionsController < ApplicationController
  before_action :set_competition, only: [:show, :edit, :update, :destroy]

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

  # GET /competitions
  # GET /competitions.json
  def index
    @competitions = Competition.all
  end

  # GET /competitions/1
  # GET /competitions/1.json
  def show
  end

  # GET /competitions/new
  def new
    @competition = Competition.new
  end

  # GET /competitions/1/edit
  def edit
  end

  # POST /competitions
  # POST /competitions.json
  def create
    @competition = Competition.new(competition_params)

    respond_to do |format|
      if @competition.save
        format.html { redirect_to @competition, notice: 'Competition was successfully created.' }
        format.json { render :show, status: :created, location: @competition }
      else
        format.html { render :new }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competitions/1
  # PATCH/PUT /competitions/1.json
  def update
    respond_to do |format|
      if @competition.update(competition_params)
        format.html { redirect_to @competition, notice: 'Competition was successfully updated.' }
        format.json { render :show, status: :ok, location: @competition }
      else
        format.html { render :edit }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competitions/1
  # DELETE /competitions/1.json
  def destroy
    @competition.destroy
    respond_to do |format|
      format.html { redirect_to competitions_url, notice: 'Competition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competition
      @competition = Competition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competition_params
      params.require(:competition).permit(:name, :year, :tournament_format, :status, :start_date, :end_date)
    end
end
