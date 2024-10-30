# app/controllers/api/priv/v1/teams_controller.rb
module Api
  module Priv
    module V1
      class TeamsController < ApplicationController
        before_action :ensure_login
        before_action :set_team, only: %i[show update destroy]

        # GET /api/priv/v1/teams
        def index
          @teams_grouped_by_level = current_user.teams
            .where(active: true)
            .includes(:team_level)
            .order('team_levels.sort_order ASC, teams.is_opponent DESC, teams.sort_order ASC')
            .group_by(&:team_level)
          render json: @teams_grouped_by_level
        end

        # GET /api/priv/v1/teams/1
        def show
          render json: @team
        end

        # POST /api/priv/v1/teams
        def create
          team_level_ids = params[:team][:team_level_ids].reject(&:blank?)
          created_teams = []

          team_level_ids.each do |team_level_id|
            team = current_user.teams.new(team_params.except(:team_level_ids).merge(team_level_id: team_level_id))

            if team.save
              created_teams << team
            else
              render json: team.errors, status: :unprocessable_entity
              return
            end
          end

          render json: created_teams, status: :created
        end

        # PATCH/PUT /api/priv/v1/teams/1
        def update
          if @team.update(team_params)
            render json: @team, status: :ok
          else
            render json: @team.errors, status: :unprocessable_entity
          end
        end

        # DELETE /api/priv/v1/teams/1
        def destroy
          @team.destroy!
          head :no_content
        end

        private

          # Use callbacks to share common setup or constraints between actions.
          def set_team
            @team = Team.find(params[:id])
          end

          # Only allow a list of trusted parameters through.
          def team_params
            params.require(:team).permit(:user_id, :team_level_id, :locale, :nickname, :abbreviation, :is_opponent, :primary_color, :secondary_color, :active, :sort_order, team_level_ids: [])
          end
      end
    end
  end
end
