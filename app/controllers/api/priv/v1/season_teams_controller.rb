# app/controllers/api/priv/v1/season_teams_controller.rb
module Api
  module Priv
    module V1
      class SeasonTeamsController < ApplicationController
        before_action :ensure_login
        before_action :set_season_team, only: %i[show update destroy]

        # GET /api/priv/v1/season_teams
        def index
          @season_teams = current_user.season_teams.all
          render json: @season_teams
        end

        # GET /api/priv/v1/season_teams/1
        def show
          render json: @season_team
        end

        # POST /api/priv/v1/season_teams
        def create
          @season_team = current_user.season_teams.new(season_team_params)

          if @season_team.save
            render json: @season_team, status: :created, location: api_priv_v1_season_team_url(@season_team)
          else
            render json: @season_team.errors, status: :unprocessable_entity
          end
        end

        # PATCH/PUT /api/priv/v1/season_teams/1
        def update
          if @season_team.update(season_team_params)
            render json: @season_team, status: :ok
          else
            render json: @season_team.errors, status: :unprocessable_entity
          end
        end

        # DELETE /api/priv/v1/season_teams/1
        def destroy
          @season_team.destroy!
          head :no_content
        end

        private

          # Use callbacks to share common setup or constraints between actions.
          def set_season_team
            @season_team = current_user.season_teams.find(params[:id])
          end

          # Only allow a list of trusted parameters through.
          def season_team_params
            params.require(:season_team).permit(:season_id, :team_id, :active)
          end
      end
    end
  end
end
