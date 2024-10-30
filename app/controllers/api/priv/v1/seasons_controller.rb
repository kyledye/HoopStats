# app/controllers/api/priv/v1/seasons_controller.rb
module Api
  module Priv
    module V1
      class SeasonsController < ApplicationController
        before_action :ensure_login
        before_action :set_season, only: %i[show update destroy]

        # GET /api/priv/v1/seasons
        def index
          @seasons = current_user.seasons.all
          render json: @seasons
        end

        # GET /api/priv/v1/seasons/1
        def show
          render json: @season
        end

        # POST /api/priv/v1/seasons
        def create
          @season = current_user.seasons.new(season_params)

          if @season.save
            render json: @season, status: :created, location: api_priv_v1_season_url(@season)
          else
            render json: @season.errors, status: :unprocessable_entity
          end
        end

        # PATCH/PUT /api/priv/v1/seasons/1
        def update
          if @season.update(season_params)
            render json: @season, status: :ok
          else
            render json: @season.errors, status: :unprocessable_entity
          end
        end

        # DELETE /api/priv/v1/seasons/1
        def destroy
          @season.destroy!
          head :no_content
        end

        private

          # Use callbacks to share common setup or constraints between actions.
          def set_season
            @season = current_user.seasons.find(params[:id])
          end

          # Only allow a list of trusted parameters through.
          def season_params
            params.require(:season).permit(:name, :start_date, :end_date, :sort_order, :active)
          end
      end
    end
  end
end
