class CompetitionTeamsController < ApplicationController
  before_action :set_competition_team, only: [:show, :edit, :update, :destroy]

  # GET /competition_teams
  # GET /competition_teams.json
  def index
    @competition_teams = CompetitionTeam.all
  end

  # GET /competition_teams/1
  # GET /competition_teams/1.json
  def show
  end

  # GET /competition_teams/new
  def new
    @competition_team = CompetitionTeam.new
  end

  # GET /competition_teams/1/edit
  def edit
  end

  # POST /competition_teams
  # POST /competition_teams.json
  def create
    @competition_team = CompetitionTeam.new(competition_team_params)

    respond_to do |format|
      if @competition_team.save
        format.html { redirect_to @competition_team, notice: 'Competition team was successfully created.' }
        format.json { render :show, status: :created, location: @competition_team }
      else
        format.html { render :new }
        format.json { render json: @competition_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competition_teams/1
  # PATCH/PUT /competition_teams/1.json
  def update
    respond_to do |format|
      if @competition_team.update(competition_team_params)
        format.html { redirect_to @competition_team, notice: 'Competition team was successfully updated.' }
        format.json { render :show, status: :ok, location: @competition_team }
      else
        format.html { render :edit }
        format.json { render json: @competition_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competition_teams/1
  # DELETE /competition_teams/1.json
  def destroy
    @competition_team.destroy
    respond_to do |format|
      format.html { redirect_to competition_teams_url, notice: 'Competition team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competition_team
      @competition_team = CompetitionTeam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competition_team_params
      params.require(:competition_team).permit(:competition_id, :team_id, :points, :goal_difference, :place)
    end
end
