class SeasonTeamsController < ApplicationController
  before_action :ensure_login
  before_action :set_season_team, only: %i[ show edit update destroy ]

  # GET /season_teams or /season_teams.json
  def index
    @season_teams = SeasonTeam.all
  end

  # GET /season_teams/1 or /season_teams/1.json
  def show
  end

  # GET /season_teams/new
  def new
    @season_team = SeasonTeam.new
  end

  # GET /season_teams/1/edit
  def edit
  end

  # POST /season_teams or /season_teams.json
  def create
    @season_team = SeasonTeam.new(season_team_params)

    respond_to do |format|
      if @season_team.save
        format.html { redirect_to @season_team, notice: "Season team was successfully created." }
        format.json { render :show, status: :created, location: @season_team }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @season_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /season_teams/1 or /season_teams/1.json
  def update
    respond_to do |format|
      if @season_team.update(season_team_params)
        format.html { redirect_to @season_team, notice: "Season team was successfully updated." }
        format.json { render :show, status: :ok, location: @season_team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @season_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /season_teams/1 or /season_teams/1.json
  def destroy
    @season_team.destroy!

    respond_to do |format|
      format.html { redirect_to season_teams_path, status: :see_other, notice: "Season team was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_season_team
      @season_team = SeasonTeam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def season_team_params
      params.fetch(:season_team, {})
    end
end
