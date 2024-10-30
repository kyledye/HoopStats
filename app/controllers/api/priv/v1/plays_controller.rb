# app/controllers/api/priv/v1/plays_controller.rb
module Api
  module Priv
    module V1
      class PlaysController < ApplicationController
        before_action :ensure_login
        before_action :set_play, only: %i[show update destroy]

        # GET /api/priv/v1/plays
        def index
          @plays = Play.all
          render json: @plays
        end

        # GET /api/priv/v1/plays/1
        def show
          render json: @play
        end

        # POST /api/priv/v1/plays
        def create
          @play = Play.new(play_params)

          if @play.save
            render json: @play, status: :created, location: api_priv_v1_play_url(@play)
          else
            render json: @play.errors, status: :unprocessable_entity
          end
        end

        # PATCH/PUT /api/priv/v1/plays/1
        def update
          if @play.update(play_params)
            render json: @play, status: :ok
          else
            render json: @play.errors, status: :unprocessable_entity
          end
        end

        # DELETE /api/priv/v1/plays/1
        def destroy
          @play.destroy!
          head :no_content
        end

        private

          # Use callbacks to share common setup or constraints between actions.
          def set_play
            @play = Play.find(params[:id])
          end

          # Only allow a list of trusted parameters through.
          def play_params
            params.require(:play).permit(:game_id, :period_id, :team_id, :play_action_id, :player_id, :foul_id, :game_clock, :sort_order, :shot_grade_id, :shot_type_id, :x_coordinate, :y_coordinate, :canvas_height, :canvas_width)
          end
      end
    end
  end
end
