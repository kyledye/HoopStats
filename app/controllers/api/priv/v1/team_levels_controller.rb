# app/controllers/api/priv/v1/team_levels_controller.rb
module Api
  module Priv
    module V1
      class TeamLevelsController < ApplicationController
        before_action :ensure_admin
        before_action :set_team_level, only: %i[show update destroy]

        # GET /api/priv/v1/team_levels
        def index
          @team_levels = TeamLevel.all
          render json: @team_levels
        end

        # GET /api/priv/v1/team_levels/1
        def show
          render json: @team_level
        end

        # POST /api/priv/v1/team_levels
        def create
          @team_level = TeamLevel.new(team_level_params)

          if @team_level.save
            render json: @team_level, status: :created, location: api_priv_v1_team_level_url(@team_level)
          else
            render json: @team_level.errors, status: :unprocessable_entity
          end
        end

        # PATCH/PUT /api/priv/v1/team_levels/1
        def update
          if @team_level.update(team_level_params)
            render json: @team_level, status: :ok
          else
            render json: @team_level.errors, status: :unprocessable_entity
          end
        end

        # DELETE /api/priv/v1/team_levels/1
        def destroy
          @team_level.destroy!
          head :no_content
        end

        private

          # Use callbacks to share common setup or constraints between actions.
          def set_team_level
            @team_level = TeamLevel.find(params[:id])
          end

          # Only allow a list of trusted parameters through.
          def team_level_params
            params.require(:team_level).permit(:name, :abbreviation, :active, :sort_order)
          end
      end
    end
  end
end
